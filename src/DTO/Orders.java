/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author TRI
 */
public class Orders {

    private int id;
    private int drinksId;
    private int invoiceId;
    private int count;

    public Orders() {
    }

    public Orders(int id, int drinksId, int count, int invoiceId) {
        this.id = id;
        this.drinksId = drinksId;
        this.invoiceId = invoiceId;
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDrinksId() {
        return drinksId;
    }

    public void setDrinksId(int drinksId) {
        this.drinksId = drinksId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

}
