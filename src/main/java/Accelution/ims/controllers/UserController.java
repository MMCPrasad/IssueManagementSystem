/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Accelution.ims.controllers;

import Accelution.ims.datatable.DataTableRequest;

import Accelution.ims.datatable.DataTableRequest;
import Accelution.ims.datatable.DataTablesResponse;
import Accelution.ims.dto.GetPagesAccDTO;
import Accelution.ims.dto.GetPagesDTO;
import Accelution.ims.dto.GetSystemsDTO;
import Accelution.ims.dto.SlimSelectDTO;
import Accelution.ims.dto.UserDataTable;
import Accelution.ims.dto.UserTypeDataTable;
import Accelution.ims.model.User;
import Accelution.ims.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin")
public class UserController {

    @Autowired
    UserService service;

    @PostMapping("/users")
    public DataTablesResponse<UserDataTable> getUsers(@RequestBody DataTableRequest param) throws Exception {
        return service.getUsers(param);
    }

    @PostMapping("/userType")
    public DataTablesResponse<UserTypeDataTable> getUserType(@RequestBody DataTableRequest param) throws Exception {
        return service.getUserType(param);
    }

    @GetMapping("/user/{id}")
    public ResponseEntity<CommonResponse> getUser(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getUser(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/user-type-save")
    public ResponseEntity<CommonResponse> saveUserType(@RequestParam String name, @RequestParam(required = false) String pages) throws Exception {
        service.saveUserType(name, pages);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/user-type-update")
    public ResponseEntity<CommonResponse> updateUserType(@RequestParam Integer id, @RequestParam String name, @RequestParam(required = false) String pages) throws Exception {
        service.updateUserType(id, name, pages);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/save-user")
    public ResponseEntity<String> saveUser(@RequestBody UserDataTable userDataTable) {
        User user = service.saveUser(userDataTable.getName(), userDataTable.getUsername(), userDataTable.getUsertype(), userDataTable.getDashboard(), userDataTable.getCompany(), userDataTable.getDepartment(), userDataTable.getAccess(), userDataTable.getEmail());

        if (user != null) {
            return new ResponseEntity<>("User saved and email sent successfully!", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Failed to save user or send email.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

//    @PostMapping("/save-user")
//    public ResponseEntity<CommonResponse> saveUser(@RequestParam String username, @RequestParam String name, @RequestParam String dashboard, @RequestParam String usertype, @RequestParam String company, @RequestParam String department, @RequestParam String access) throws Exception {
//        service.saveUser(name, username, dashboard, usertype, company, department, access);
//        CommonResponse response = new CommonResponse("Success!", 200);
//        return new ResponseEntity<>(response, HttpStatus.OK);
//    }
    @PostMapping("/update-user")
    public ResponseEntity<CommonResponse> saveUser(@RequestParam Integer id, @RequestParam String username, @RequestParam String dashboard, @RequestParam String name, @RequestParam String usertype, @RequestParam String company, @RequestParam String department, @RequestParam String access, @RequestParam String email) throws Exception {
        service.updateUser(id, name, username, dashboard, usertype, company, department, access, email);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-user")
    public ResponseEntity<CommonResponse> deactivateUser(@RequestParam Integer id) throws Exception {
        service.deactivateUser(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-user")
    public ResponseEntity<CommonResponse> reactivateUser(@RequestParam Integer id) throws Exception {
        service.reactivateUser(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-user-Type")
    public ResponseEntity<CommonResponse> deactivateUserType(@RequestParam Integer id) throws Exception {
        service.deactivateUserType(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-user-Type")
    public ResponseEntity<CommonResponse> reactivateUserType(@RequestParam Integer id) throws Exception {
        service.reactivateUserType(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/getpages")
    public GetPagesDTO getPage() throws Exception {

        return service.getPage();
    }

    @RequestMapping("/page-access")
    public Iterable<GetPagesAccDTO> getPageAccess(HttpSession session) throws Exception {
        return service.getPageAccess((Integer) session.getAttribute("uid"));
    }

    @PostMapping("/get-userType")
    public GetPagesDTO getUserType(@RequestParam Integer id) throws Exception {
        return service.getSelectedPage(id);
    }

    @PostMapping("/search-user-types")
    public Iterable<SlimSelectDTO> searchUserTypes(@RequestParam String search) throws Exception {
        return service.getUserTypeIdAndName(search);
    }

    @PostMapping("/dashbaord-type")
    public Iterable<SlimSelectDTO> searchDashbaords(@RequestParam String search) throws Exception {
        return service.searchDashbaords(search);
    }

//    @PostMapping("/search-admin-types")
//    public Iterable<SlimSelectDTO> searchAdminTypes(@RequestParam String search) throws Exception {
//        return service.getAdminTypeIdAndName(search);
//    }
    @PostMapping("/get-all-systems")
    public GetSystemsDTO getAllSystems() throws Exception {

        return service.getAllSystems();
    }

}
