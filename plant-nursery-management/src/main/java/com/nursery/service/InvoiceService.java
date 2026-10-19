package com.nursery.service;

import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.*;
import com.itextpdf.layout.element.*;
import com.nursery.entity.*;
import org.springframework.stereotype.Service;
import java.io.ByteArrayOutputStream;

@Service
public class InvoiceService {

    public byte[] generate(Order order) throws Exception {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter writer = new PdfWriter(out);
        PdfDocument pdf = new PdfDocument(writer);
        Document doc = new Document(pdf);

        doc.add(new Paragraph("Nursery Invoice"));
        doc.add(new Paragraph("Customer: " + order.getCustomerName()));

        for(OrderItem i : order.getItems()){
            doc.add(new Paragraph(i.getPlant().getName()
                    + " x " + i.getQuantity()
                    + " = ₹" + i.getSubtotal()));
        }

        doc.add(new Paragraph("Final Total: ₹" + order.getFinalAmount()));
        doc.close();

        return out.toByteArray();
    }
}