/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Accelution.ims.dto;

import lombok.Getter;
import lombok.Setter;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class IssueDTO {

    private Integer id;
    private String ref_number;
    private String issue_type;
    private String priority;
    private String type;
    private String comment;
    private String status;
    public String ent_by;
    public String ent_on;
    public String mod_by;
    public String mod_on;

}
