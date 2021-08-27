package ru.faulab.lucky.parking;

import io.smallrye.mutiny.Uni;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/rest")
public class ExampleResource
{

    @GET
    @Path("/hello")
    @Produces(MediaType.APPLICATION_JSON)
    public Uni<Dto> hello()
    {
        return Uni.createFrom().item(new Dto("String", 42));
    }
}