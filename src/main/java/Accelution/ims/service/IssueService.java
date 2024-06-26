/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Accelution.ims.service;

import Accelution.ims.datatable.DataTableRepo;
import Accelution.ims.datatable.DataTableRequest;
import Accelution.ims.datatable.DataTablesResponse;
import Accelution.ims.dto.SlimSelectDTO;
import Accelution.ims.dto.IssueDTO;
import Accelution.ims.model.FilePendings;
import Accelution.ims.model.Issue;
import Accelution.ims.repo.FilePendingRepo;
import Accelution.ims.repo.IssueRepo;
import Accelution.ims.repo.TypeRepo;
import Accelution.ims.repo.UserRepo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Path;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author L580
 */
@Service
public class IssueService {

    @Autowired
    private DataTableRepo<IssueDTO> userDt;
    @Autowired
    private IssueRepo repo;
    @Autowired
    private TypeRepo repor;
    @Autowired
    private UserRepo repors;
    @Autowired
    private FilePendingRepo issuerepo;

//    Operation
    public DataTablesResponse<IssueDTO> getIssues(DataTableRequest param) throws Exception {
        String stage = param.getData();

        String sql = "SELECT x.`id`,x.`issue_type`,x.`status`,x.`ref_number`,x.`comment`,(SELECT i.name FROM `issue_types` i WHERE i.`id`=x.`type`)AS `type`,(SELECT p.type FROM `priority` p WHERE p.`id`=x.`priority`)AS `priority`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issues` X WHERE TRUE";
        if (!stage.equals("all")) {
            if (stage.equals("queue")) {
                sql += " AND `status`='Queue'";
            } else if (stage.equals("develop")) {
                sql += " AND `status`='Development Pending'";
            } else if (stage.equals("testing")) {
                sql += " AND `status`='Testing Pending'";
            } else if (stage.equals("approve")) {
                sql += " AND `status`='QA Pending'";
            } else if (stage.equals("completed")) {
                sql += " AND `status`='Completed'";
            } else if (stage.equals("unsucces")) {
                sql += " AND `status`='Unsuccessful'";
            }
        }
        return userDt.getData(IssueDTO.class, param, sql);

    }

//    //    branch
//    public DataTablesResponse<IssueDTO> getIssuesBrnch(DataTableRequest param, Integer userId) throws Exception {
//        String stage = param.getData();
//        StringBuilder sql = new StringBuilder("SELECT x.`id`, x.`customer_name`, x.`status`, x.`ref_number`, "
//                + "(SELECT `description` FROM `loan`.`product` WHERE `id` = x.`product`) AS product, "
//                + "(SELECT `name` FROM `loan`.`branch` WHERE `id` = x.`branch`) AS branch, x.`amount`, x.`pendings`, "
//                + "x.`comment`, x.`approver`, x.`facility_status`, "
//                + "(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`, `ent_on`, "
//                + "(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`, `mod_on` "
//                + "FROM `issue` x WHERE TRUE AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)");
//
//        if (!"all".equals(stage)) {
//            switch (stage) {
//                case "acknowledgment":
//                    sql.append(" AND x.`status`='Acknowledgment Pending'");
//                    break;
//                case "file":
//                    sql.append(" AND x.`status`='Exceptions'");
//                    break;
//                case "acknowledged":
//                    sql.append(" AND x.`status`='Acknowledged'");
//                    break;
//                case "underrec":
//                    sql.append(" AND x.`status`='Undertaking Recommendation'");
//                    break;
//                case "underapp":
//                    sql.append(" AND x.`status`='Undertaking Approval Pending'");
//                    break;
//                case "payment":
//                    sql.append(" AND x.`status`='Payment Voucher Hand Over To Finance'");
//                    break;
//                case "paymentunder":
//                    sql.append(" AND x.`status`='Payment Voucher Hand Over To Finance(Undertaking Approval)'");
//                    break;
//                case "completed":
//                    sql.append(" AND x.`status`='Completed'");
//                    break;
//                case "completedun":
//                    sql.append(" AND x.`status`='Completed(Undertaking Approval)'");
//                    break;
//                case "rejected":
//                    sql.append(" AND x.`status`='Rejected'");
//                    break;
//                default:
//                    break;
//            }
//        }
//
//        return userDt.getData(IssueDTO.class, param, sql.toString(), userId);
//    }
//
////Approver
//    public DataTablesResponse<IssueDTO> getIssueApprove(DataTableRequest param, Integer userId) throws Exception {
//        String stage = param.getData();
//        String sql;
//
//        // Construct SQL query based on the stage
//        if (stage.equals("underrec")) {
//            sql = "SELECT x.`id`, x.`customer_name`, x.`status`, x.`ref_number`, "
//                    + "(SELECT `description` FROM `loan`.`product` WHERE `id` = x.`product`) AS product, "
//                    + "(SELECT `name` FROM `loan`.`branch` WHERE `id` = x.`branch`) AS branch, "
//                    + "x.`amount`, x.`pendings`, x.`comment`, x.`approver`, x.`facility_status`, "
//                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`, "
//                    + "x.`ent_on`, "
//                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`, "
//                    + "x.`mod_on` "
//                    + "FROM `issue` X "
//                    + "WHERE x.`status` = 'Undertaking Recommendation'";
//        } else {
//            sql = "SELECT x.`id`, x.`customer_name`, x.`status`, x.`ref_number`, "
//                    + "(SELECT `description` FROM `loan`.`product` WHERE `id` = x.`product`) AS product, "
//                    + "(SELECT `name` FROM `loan`.`branch` WHERE `id` = x.`branch`) AS branch, "
//                    + "x.`amount`, x.`pendings`, x.`comment`, x.`approver`, x.`facility_status`, "
//                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`, "
//                    + "x.`ent_on`, "
//                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`, "
//                    + "x.`mod_on` "
//                    + "FROM `issue` X "
//                    + "WHERE x.`approver` = ? AND x.`status` = 'Undertaking Approval Pending'";
//        }
//
//        // Execute the query with the userId parameter if the stage is not underrec
//        if (!stage.equals("underrec")) {
//            return userDt.getData(IssueDTO.class, param, sql, userId);
//        } else {
//            return userDt.getData(IssueDTO.class, param, sql);
//        }
//    }
//
//    public DataTablesResponse<IssueDTO> getIssueApprovse(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='Acknowledgment Pending' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//    public DataTablesResponse<IssueDTO> getIssuefileBranch(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='File Pending Details' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//    public DataTablesResponse<IssueDTO> getIssueclearanceBranch(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='File Pending Clearance' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//    public DataTablesResponse<IssueDTO> getIssueapprovalBranch(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,(SELECT `name` FROM `users` WHERE `id` = x.`approver`)AS approver,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='Undertaking Approval Pending' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//    public DataTablesResponse<IssueDTO> getIssuepaymentBranch(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='Payment Voucher Hand Over To Finance' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//    public DataTablesResponse<IssueDTO> getIssuepaymentUABranch(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='Payment Voucher Hand Over To Finance(Undertaking Approval)' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//    public DataTablesResponse<IssueDTO> getIssueCompletedBranch(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='Completed' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//    public DataTablesResponse<IssueDTO> getIssueRejectBranch(DataTableRequest param, Integer userId) throws Exception {
//        return userDt.getData(IssueDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `issue` X WHERE `status`='Rejected' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);
//
//    }
//
//
//
//    public Iterable<SlimSelectDTO> getBranches(String search) {
//        return repor.getBranches("%" + search.trim() + "%");
//    }
//
//    public Iterable<SlimSelectDTO> getProduct(String search) {
//        return repor.getProduct("%" + search.trim() + "%");
//    }
    public Iterable<SlimSelectDTO> getStatus(String search) {
        return repo.getStatus("%" + search.trim() + "%");
    }

    public Iterable<SlimSelectDTO> getPrio(String search) {
        return repo.getPrio("%" + search.trim() + "%");
    }

    public Issue saveIssue(String issue_type, String priority, String comment, String assign, String type, HttpSession session) {
        Issue saveissue = new Issue();
        saveissue.setIssue_type(issue_type);
        saveissue.setPriority(priority);
        saveissue.setComment(comment);
        saveissue.setAssign(assign);
        saveissue.setType(type);
//        String branchFromSession = (String) session.getAttribute("branch");
//        saveissue.setBranch(branchFromSession);
        saveissue.setStatus("Queue");
        saveissue = repo.save(saveissue);

        return saveissue;
    }

    public Issue updateIssue(Integer id, String statusque, String reason) throws Exception {
        Issue updateissue = repo.findById(id).get();

        switch (statusque) {
            case "uns":
                updateissue.setStatus("Unsuccessful");
                updateissue.setReason(reason);
                break;

            case "devPen":
                updateissue.setStatus("Development Pending");
                break;

            default:

                break;
        }

        updateissue = repo.save(updateissue);
        return updateissue;
    }
//
    @Autowired
    private JdbcTemplate jdbc;

    public Map<String, Object> getIssueses(Integer id) throws Exception {
        Issue sys = repo.findById(id).get();

        Map<String, Object> name = jdbc.queryForMap("SELECT `name` as entered FROM `users` WHERE `id` = ?", sys.getEnt_by());
        sys.setEntUser((String) name.get("entered"));
//        System.out.println(name);
        Map<String, Object> combinedData = new HashMap<>();
        combinedData.put("d2", name);
        combinedData.put("obj", sys);

        return combinedData;
    }
//
//    @Autowired
//    private JdbcTemplate jdbc;
//
//    public Issue getIssueFile(Integer id) throws Exception {
//        Issue sys = repo.findById(id).get();
//
//        Map<String, Object> data = jdbc.queryForMap("SELECT `description` as product_txt FROM `loan`.`product`  WHERE `id` = ?", sys.getProduct());
//        System.out.println(data);
//        sys.setProductTxt((String) data.get("product_txt"));
//
//        return sys;
//    }
//
//    private final ObjectMapper mapper = new ObjectMapper();
//
//    public Issue uploadFiles(Integer id, String desclist, String statusack) throws Exception {
//        Issue system = repo.findById(id).orElseThrow(() -> new Exception("Record not found with id: " + id));
//        system.setPendings(system.getId());
//
//        system = repo.save(system);
//
//        switch (statusack) {
//            case "payProcess":
//                system.setStatus("Payment Voucher Hand Over To Finance");
//                break;
//
//            case "fileped":
//                system.setStatus("Exceptions");
//                JsonNode fileList = mapper.readTree(desclist);
//                for (JsonNode fileItem : fileList) {
//                    FilePendings attachment = new FilePendings();
//                    attachment.setPendings(system.getId());
//                    attachment.setName(fileItem.get("name").asText());
//                    attachment.setJustification(fileItem.get("justification").asText());
//                    attachment.setDate(LocalDate.parse(fileItem.get("completionDate").asText()));
//                    attachment.setStatus("active");
//                    issuerepo.save(attachment);
//                }
//                break;
//
//            default:
//                // Handle default case if necessary
//                break;
//        }
//
//        return repo.save(system);
//    }
//
//    public Object getClearance(Integer id) throws Exception {
//        Issue sys = repo.findById(id).orElseThrow(() -> new Exception("Issue not found for id: " + id));
//
//        // Fetch product data
//        Map<String, Object> data;
//        try {
//            data = jdbc.queryForMap("SELECT `description` as product_txt FROM `loan`.`product` WHERE `id` = ?", sys.getProduct());
//            sys.setProductTxt((String) data.get("product_txt"));
//        } catch (EmptyResultDataAccessException e) {
//            // Handle the case where no product is found
//            data = new HashMap<>();
//            data.put("product_txt", "Product not found");
//            sys.setProductTxt("Product not found");
//        }
//
//        // Fetch approver data
//        Map<String, Object> datas;
//        try {
//            datas = jdbc.queryForMap("SELECT `name` as approvername FROM `users` WHERE `id` = ?", sys.getApprover());
//            sys.setApproverName((String) datas.get("approvername"));
//        } catch (EmptyResultDataAccessException e) {
//            // Handle the case where no approver is found
//            datas = new HashMap<>();
//            datas.put("approvername", "Approver not found");
//            sys.setApproverName("Approver not found");
//        }
//
//        // Fetch content again to ensure it's up-to-date
//        Issue content = repo.findById(id).orElseThrow(() -> new Exception("Issue not found for id: " + id));
//        List<FilePendings> videos = issuerepo.findByPendingsAndStatus(id, "active");
//
//        for (FilePendings video : videos) {
//            try {
//                Map<String, Object> name = jdbc.queryForMap("SELECT `name` as entered FROM `users` WHERE `id` = ?", video.getMod_by());
//                String enteredName = (String) name.get("entered");
//                video.setModby(enteredName);
//            } catch (EmptyResultDataAccessException e) {
//                // Handle the case where no user is found
//                video.setModby("User not found");
//            }
//        }
//
//        // Adding all the data to the return map
//        Map<String, Object> result = new HashMap<>();
//        result.put("productData", data);
//        result.put("approverData", datas);
//        result.put("content", content);
//        result.put("videos", videos);
//
//        return result;
//    }
//
//    public Issue updateClearance(Integer id, String desclist, String deleteIds, String statusclr) {
//        try {
//            Issue system = repo.findById(id).orElseThrow(() -> new Exception("FMR not found"));
//
//            // Handle deleteIds
//            if (deleteIds != null) {
//                JsonNode toBeDeleted = mapper.readTree(deleteIds);
//                for (JsonNode jsonNode : toBeDeleted) {
//                    Optional<FilePendings> optionalMembers = issuerepo.findById(Integer.parseInt(jsonNode.asText()));
//                    if (optionalMembers.isPresent()) {
//                        FilePendings attachmentToDelete = optionalMembers.get();
//                        attachmentToDelete.setStatus("deactivate");
//                        issuerepo.save(attachmentToDelete);
//                    } else {
//                        throw new Exception("FMR with ID " + jsonNode.asText() + " not found");
//                    }
//                }
//            }
//
//            // Handle desclist
//            if (desclist != null && !desclist.isEmpty()) {
//                JsonNode fileList = mapper.readTree(desclist);
//                for (int i = 0; i < fileList.size(); i++) {
//                    JsonNode fileItem = fileList.get(i);
//                    String fileName = fileItem.get("name").asText();
//
//                    FilePendings attachment = new FilePendings();
//                    attachment.setPendings(system.getId());
//                    attachment.setName(fileName);
//                    attachment.setStatus("active");
//                    issuerepo.save(attachment);
//                }
//            }
//
//            // Handle statusclr
//            if ("approve".equals(statusclr)) {
////                system.setApprover(approver);
//                system.setStatus("Undertaking Recommendation");
//            } else if ("cleared".equals(statusclr)) {
//                system.setStatus("Payment Voucher Hand Over To Finance");
//            }
//
//            return repo.save(system);
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new RuntimeException("Failed to update FMR with File Pendings", e);
//        }
//    }
//
//    private boolean containsMembersId(String desclist, Integer attachmentId) throws JsonProcessingException {
//        JsonNode fileList = mapper.readTree(desclist);
//        for (int i = 0; i < fileList.size(); i++) {
//            JsonNode fileItem = fileList.get(i);
//            Integer fileId = fileItem.get("fileId").asInt();
//            if (fileId.equals(attachmentId)) {
//                return true;
//            }
//        }
//        return false;
//    }
//
//    public Iterable<SlimSelectDTO> getApprover(String search) {
//        return repors.getApprover("%" + search.trim() + "%");
//    }
//
//    public Issue updateRecommendation(Integer id, String approver) throws Exception {
//        Issue rec = repo.findById(id).get();
//
//        rec.setApprover(approver);
//        rec.setStatus("Undertaking Approval Pending");
//
//        rec = repo.save(rec);
//        return rec;
//    }
//
//    public Issue updateUndertaking(Integer id, String statusund) throws Exception {
//        Issue updateissue = repo.findById(id).get();
//
//        switch (statusund) {
//            case "returned":
//                updateissue.setStatus("Exceptions");
//
//                break;
//            case "approved":
//                updateissue.setStatus("Payment Voucher Hand Over To Finance(Undertaking Approval)");
//                break;
//
//            default:
//                // Handle default case if necessary
//                break;
//        }
//
//        updateissue = repo.save(updateissue);
//        return updateissue;
//    }
//
//    public Issue updatePaymentUP(Integer id, String desclist, String deleteIds, String statusvoucherun) {
//        try {
//            Issue system = repo.findById(id).orElseThrow(() -> new Exception("FMR not found"));
//
//            // Handle deleteIds
//            if (deleteIds != null) {
//                JsonNode toBeDeleted = mapper.readTree(deleteIds);
//                for (JsonNode jsonNode : toBeDeleted) {
//                    Optional<FilePendings> optionalMembers = issuerepo.findById(Integer.parseInt(jsonNode.asText()));
//                    if (optionalMembers.isPresent()) {
//                        FilePendings attachmentToDelete = optionalMembers.get();
//                        attachmentToDelete.setStatus("deactivate");
//                        issuerepo.save(attachmentToDelete);
//                    } else {
//                        throw new Exception("FMR with ID " + jsonNode.asText() + " not found");
//                    }
//                }
//            }
//
//            // Handle desclist
//            if (desclist != null && !desclist.isEmpty()) {
//                JsonNode fileList = mapper.readTree(desclist);
//                for (int i = 0; i < fileList.size(); i++) {
//                    JsonNode fileItem = fileList.get(i);
//                    String fileName = fileItem.get("name").asText();
//
//                    FilePendings attachment = new FilePendings();
//                    attachment.setPendings(system.getId());
//                    attachment.setName(fileName);
//                    attachment.setStatus("active");
//                    issuerepo.save(attachment);
//                }
//            }
//            switch (statusvoucherun) {
//                case "completedun":
//                    system.setStatus("Completed(Undertaking Approval)");
//                    break;
//
//                default:
//                    // Handle default case if necessary
//                    break;
//            }
//            return repo.save(system);
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new RuntimeException("Failed to update FMR with File Pendings", e);
//        }
//    }
//
//    public Map<String, Object> getPayment(Integer id) throws Exception {
//        // Fetch the Issue object
//        Issue sys = repo.findById(id).orElseThrow(() -> new Exception("Issue not found for id: " + id));
//
//        // Fetch product data
//        Map<String, Object> data;
//        try {
//            data = jdbc.queryForMap("SELECT `description` as product_txt FROM `loan`.`product` WHERE `id` = ?", sys.getProduct());
//            sys.setProductTxt((String) data.get("product_txt"));
//        } catch (EmptyResultDataAccessException e) {
//            // Handle the case where no product is found
//            data = new HashMap<>();
//            data.put("product_txt", "Product not found");
//            sys.setProductTxt("Product not found");
//        }
//        System.out.println(data);
//
//        // Fetch approver data
//        Map<String, Object> datas;
//        try {
//            datas = jdbc.queryForMap("SELECT `name` as approvername FROM `users` WHERE `id` = ?", sys.getApprover());
//            sys.setApproverName((String) datas.get("approvername"));
//        } catch (EmptyResultDataAccessException e) {
//            // Handle the case where no approver is found
//            datas = new HashMap<>();
//            datas.put("approvername", "Approver not found");
//            sys.setApproverName("Approver not found");
//        }
//        System.out.println(datas);
//
//        // Combine the data into a single map
//        Map<String, Object> combinedData = new HashMap<>();
//        combinedData.put("d1", data);
//        combinedData.put("d2", datas);
//        combinedData.put("obj", sys);
//
//        return combinedData;
//    }
//
//    public Issue updateVoucher(Integer id, String statusvoucher) throws Exception {
//        Issue updateissue = repo.findById(id).get();
//
//        switch (statusvoucher) {
//            case "completed":
//                updateissue.setStatus("Completed");
//                break;
//
//            default:
//                // Handle default case if necessary
//                break;
//        }
//
//        updateissue = repo.save(updateissue);
//        return updateissue;
//    }

    public Long countAllStatus() {
        return repo.countByStatusAll();
    }

    public Long countAcknoPendStatus() {
        return repo.countByStatusAcknoPe();
    }

    public Long countAcknoStatus() {
        return repo.countByStatusAckno();
    }

    public Long countExceptionsStatus() {
        return repo.countByStatusExceptions();
    }

    public Long countUndertakinStatus() {
        return repo.countByStatusUnder();
    }

    public Long countPaymentStatus() {
        return repo.countByStatusPayment();
    }

    public Long countCompletedStatus() {
        return repo.countByStatusCompleted();
    }

    public Long countRejectedStatus() {
        return repo.countByStatusRejected();
    }
}
