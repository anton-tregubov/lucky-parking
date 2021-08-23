package ru.faulab.lucky.parking;

import io.smallrye.config.*;

@ConfigMapping(prefix = "greeting")
public interface GreetingConfig
{

    @WithName("message")
    String message();
}