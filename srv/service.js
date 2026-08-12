let impl = async function(srv123){
    // Simple Event Handler
    srv123
        .before("READ","AlternateSuppliers",function(req){
            console.log("Read Triggered!");
        })
    
    let injectSupplierRatingInName = function(data,req){
        let startOfDay = new Date();
        startOfDay.setHours(0,0,0,0);

        for(let i=0; i < data.length; i++){
            console.log(data[i])
            // data[i].SupplierRating /= 10;
            if(data[i].SupplierRating >=5){
              data[i].SupplierName +=  "- Highly Rated";
            }

            if(new Date(data[i].modifiedAt) >= startOfDay){
                data[i].SupplierName +=  "- Recently Updated";
            }

        }
    }
    
    srv123.after("READ","AlternateSuppliers",injectSupplierRatingInName);

    async function countryCodeValidation(req){
        if(req.data?.CountryCode){
            let countryCode = req.data.CountryCode;
            let country = await SELECT.one.from("sap.common.Countries")
                            .where({code:countryCode});
            if(!country){
                return req.error(400, 'Country not found');
            }
        }
    }

    // srv123.before("UPDATE","AlternateSuppliers",countryCodeValidation)
    // srv123.before("CREATE","AlternateSuppliers",countryCodeValidation)
    srv123.before("WRITE","AlternateSuppliers",countryCodeValidation);

    srv123.on("SupplierItemCount","AlternateSuppliers",async function(req){
        let supplierID = req.params[0].ID;
        let supplierMaterials = await SELECT("ID").from("ResilienceCockpit.SupplierMaterials").where({AlternateSupplier_ID:supplierID});
        return supplierMaterials.length;
    });

    srv123.on("UpVote","AlternateSuppliers",async function(req){
        let supplierID = req.params[0].ID;
        let supplierObject = await SELECT.one.from("ResilienceCockpit.AlternateSuppliers").where({ID:supplierID});

        supplierObject.SupplierRating += 1;
        
        await UPDATE("ResilienceCockpit.AlternateSuppliers").set({SupplierRating:supplierObject.SupplierRating}).where({ID:supplierID});
        
        req.notify("Rating Updated");

        return supplierObject;
    });
    srv123.on("DownVote", "AlternateSuppliers", async function(req){
    let supplierID = req.params[0].ID;

    let supplierObject = await SELECT.one
        .from("ResilienceCockpit.AlternateSuppliers")
        .where({ID:supplierID});

    supplierObject.SupplierRating -= 1;

    await UPDATE("ResilienceCockpit.AlternateSuppliers")
        .set({SupplierRating:supplierObject.SupplierRating})
        .where({ID:supplierID});

    req.notify("Rating Updated");

    return supplierObject;
});

    srv123.after("NEW","AlternateSuppliers.drafts",async function(req){
        console.log("New Draft entry is created")
    });


    let S4API = await cds.connect.to("API_INFORECORD_PROCESS_SRV");
    srv123.on("READ","A_PurchasingInfoRecord", async function(req){

         // Sanitize Request
         
         req.query.SELECT.columns.push({ref:['Supplier']});
         const data = await S4API.read(req.query);

         // Construct Data
         if(data.constructor === Array){
         return Promise.all(data.map(async record => {
            let supplier = await SELECT.one.from("ResilienceCockpit.SupplierLocations").where({ Supplier: record.Supplier });
            if (supplier) {
                record.Lat = supplier.Lat;
                record.Lng = supplier.Lng;
            }
            return record;
        }))
    } else if(data.Supplier) {
        let supplier = await SELECT.one.from("ResilienceCockpit.SupplierLocations").where({ Supplier: data.Supplier });
        if (supplier) {
            data.Lat = supplier.Lat;
            data.Lng = supplier.Lng;
        }
        return data;
    }
    else {
        return data;
    }
})
}
module.exports = impl;