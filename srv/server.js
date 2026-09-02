const cds = require('@sap/cds')
const express = require('express')()
const PDFDocument = require('pdfkit');

cds.on('bootstrap', (app) => {
    // Inject custom Express middlewar
    

    // Example: Serve a custom status or health check endpoint
    app.get('/generate-pdf', async (req, res) => {
        req.query; // Extract query parameters from the request
        if(!req.query.id) {
            return res.status(200).send('');
        }
        let partNumber = req.query.id; // Use the 'id' query parameter to customize the PDF content

    // 1. Initialize a new PDF document
    const doc = new PDFDocument({
        size: 'A4',
        margin: 50,
    });

    // 2. Set response headers so the browser recognizes the stream as a PDF
    res.setHeader('Content-Type', 'application/pdf');
    
    // Use 'inline' to view in browser, or 'attachment' to force download:
    // res.setHeader('Content-Disposition', 'attachment; filename="document.pdf"');
    res.setHeader('Content-Disposition', 'inline; filename="sample.pdf"');

    // 3. Pipe the PDF stream directly to the HTTP response
    doc.pipe(res);

    // 4. Inject content into the PDF
    doc
        .fontSize(22)
        .fillColor('#2C3E50')
        .text('Dynamic PDF Report : ' + partNumber, { align: 'center' });

    doc.moveDown(1.5);

    let materials = await cds.run(`SELECT * FROM ResilienceCockpit_SupplierMaterials WHERE ID = ?`, [partNumber]);
    
    let material = materials[0] || {};

    doc.table({
        data: [
            ['Voltage', 'Height', 'Length', 'Width'],
            [material.Specifications_Voltage || 'N/A', material.Specifications_Dimentions_Height || 'N/A', material.Specifications_Dimentions_Length || 'N/A', material.Specifications_Dimentions_Width || 'N/A']
        ]
    });

    doc
        .fontSize(12)
        .fillColor('#333333')
        .text(
        'This document was dynamically created and injected into the response stream using PDFKit on Node.js.',
        {
            align: 'left',
            lineGap: 4,
        }
        );

    doc.moveDown();

    // Add bullet points
    doc.text('Key Highlights:', { underline: true });
    doc.list([
        'Direct streaming without saving temporary files to disk',
        'Custom page sizes, margins, and vector graphics support',
        'Dynamic text and layout generation on demand',
    ]);

    doc.moveDown(2);

    // Add a simple geometric element / separator line
    doc
        .strokeColor('#BDC3C7')
        .lineWidth(1)
        .moveTo(50, doc.y)
        .lineTo(545, doc.y)
        .stroke();

    doc.moveDown();

    // Footer text
    doc
        .fontSize(10)
        .fillColor('#7F8C8D')
        .text(`Generated on: ${new Date().toLocaleString()}`, {
        align: 'right',
        });

    // 5. Finalize the PDF document
    doc.end();
    });
})


// Standard fallback bootstrap handler
module.exports = cds.server