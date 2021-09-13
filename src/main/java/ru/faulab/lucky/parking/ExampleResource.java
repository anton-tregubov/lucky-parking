package ru.faulab.lucky.parking;

import io.quarkus.security.identity.SecurityIdentity;
import io.smallrye.mutiny.Uni;

import javax.annotation.security.RolesAllowed;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/rest")
public class ExampleResource
{

    @Inject
    SecurityIdentity securityIdentity;

    @GET
    @Path("/hello")
    @Produces(MediaType.APPLICATION_JSON)
    public Uni<Dto> hello()
    {
        return Uni.createFrom().item(new Dto("String", 42));
    }

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/no-role")
    public String noRoles()
    {
        return "Access for " + securityIdentity.getPrincipal().getName() + " is granted. Roles are: " + securityIdentity.getRoles();
    }

    @GET
    @RolesAllowed("lucky-parking-access")
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/secured")
    public String secured()
    {
        return "Access for " + securityIdentity.getPrincipal().getName() + " is granted";
    }
}