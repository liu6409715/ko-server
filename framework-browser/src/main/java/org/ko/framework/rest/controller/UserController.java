package org.ko.framework.rest.controller;

import io.swagger.annotations.Api;
import org.ko.framework.core.support.Response;
import org.ko.framework.rest.condition.UserQueryCondition;
import org.ko.framework.rest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
@Api("用户模块")
@Validated
public class UserController {

    @Autowired private UserService userService;

    @GetMapping
    public Response queryUserList(UserQueryCondition condition) {
        return null;

    }


}