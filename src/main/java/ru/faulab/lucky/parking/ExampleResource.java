package ru.faulab.lucky.parking;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/hello")
public class ExampleResource
{

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello()
    {
        return "Hello RESTEasy Reactive";
    }
}