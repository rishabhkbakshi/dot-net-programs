using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Car
/// </summary>
public class Car
{
    string Color;

    public string Color1
    {
        get { return Color; }
        set { Color = value; }
    }
    int price;

    public int Price
    {
        get { return price; }
        set { price = value; }
    }
    string model;

    public string Model
    {
        get { return model; }
        set { model = value; }
    }
	public Car()
	{
        
	}
}
