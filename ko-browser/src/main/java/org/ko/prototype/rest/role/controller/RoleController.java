package org.ko.prototype.rest.role.controller;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.collections.CollectionUtils;
import org.ko.prototype.core.support.Response;
import org.ko.prototype.core.type.SystemCode;
import org.ko.prototype.data.master.domain.Role;
import org.ko.prototype.rest.role.condition.RoleQueryListCondition;
import org.ko.prototype.rest.role.dto.RoleDTO;
import org.ko.prototype.rest.role.dto.RoleMenuDTO;
import org.ko.prototype.rest.role.service.RoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Api(description = "权限接口")
@RestController
@RequestMapping("role")
@Validated
public class RoleController {

    @Autowired private RoleService roleService;

    @GetMapping
    @ApiOperation("查询全部权限")
    public Response<List<RoleDTO>> queryRoleList(@ApiParam("权限查询参数") @ModelAttribute RoleQueryListCondition condition) {
        //1. 查询用户列表数据
        List<Role> roles = roleService.queryRoleList(condition);

        //2. 如果不为空
        if (CollectionUtils.isNotEmpty(roles)) {
            List<RoleDTO> roleDTOS = roles.stream().map(this::map).collect(Collectors.toList());
            return new Response<>(roleDTOS);
        }
        return new Response<>(SystemCode.EMPTY_DATA);
    }

    @GetMapping("{id:\\d+}")
    @ApiOperation("通过ID查询权限")
    public Response<RoleDTO> queryRoleInfo (@ApiParam("主键") @PathVariable Long id) {
        Role role = roleService.queryRoleInfo(id);
        return new Response<>(map(role));
    }

    @PostMapping
    @ApiOperation("新增权限")
    public Response<Long> createRole (
            @ApiParam("权限传输对象实体") @RequestBody RoleDTO roleDTO) {
        Long roleId = roleService.createRole(map(roleDTO));;
        return new Response<>(roleId);
    }

    @PutMapping("{id:\\d+}")
    @ApiOperation("修改权限")
    public Response<RoleDTO> updateRole (
            @ApiParam("用户ID主键") @PathVariable Long id,
            @ApiParam("用户传输对象实体") @RequestBody RoleDTO roleDTO) {
        Role role = roleService.updateRole(id, map(roleDTO));
        return new Response<>(map(role));
    }

    @DeleteMapping("{id:\\d+}")
    @ApiOperation("删除权限")
    public Response<Long> deleteRole(@ApiParam("用户ID主键") @PathVariable Long id) {
        Long result = roleService.deleteRole(id);
        return new Response<>(result);
    }

    @GetMapping("menu/{id:\\d+}")
    @ApiOperation("获取单一权限下的全部菜单")
    public Response<RoleMenuDTO> queryRoleMenuByRoleId (@ApiParam("用户权限编号") @PathVariable Long id) {
        return null;
    }

    /**
     * Role mapTo RoleDTO
     * @param role
     * @return roleDTO
     */
    private RoleDTO map (Role role) {
        RoleDTO roleDTO = new RoleDTO();
        BeanUtils.copyProperties(role, roleDTO);
        return roleDTO;
    }

    /**
     * RoleDTO mapTo Role
     * @param roleDTO
     * @return
     */
    private Role map (RoleDTO roleDTO) {
        Role role = new Role();
        BeanUtils.copyProperties(roleDTO, role);
        return role;
    }

}
