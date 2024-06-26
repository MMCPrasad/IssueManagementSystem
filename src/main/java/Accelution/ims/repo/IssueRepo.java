/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Accelution.ims.repo;

import Accelution.ims.dto.SlimSelectDTO;
import Accelution.ims.model.Issue;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author cpm.999cc
 */
@Repository
public interface IssueRepo extends CrudRepository<Issue, Integer> {

    Iterable<Issue> findByStatus(String status);

    @Query("SELECT `id` AS `value`, `name` AS `text` FROM `users`")
    Iterable<SlimSelectDTO> getStatus(@Param("search") String search);

    @Query("SELECT `id` AS `value`, `type` AS `text` FROM `priority`")
    Iterable<SlimSelectDTO> getPrio(@Param("search") String search);

    @Query("SELECT COUNT(*) AS COUNT FROM fmr")
    Long countByStatusAll();

    @Query("SELECT COUNT(*) AS COUNT FROM fmr WHERE `status` = 'Acknowledgment Pending'")
    Long countByStatusAcknoPe();

    @Query("SELECT COUNT(*) AS COUNT FROM fmr WHERE `status` = 'Acknowledged'")
    Long countByStatusAckno();

    @Query("SELECT COUNT(*) AS COUNT FROM fmr WHERE `status` = 'Exceptions'")
    Long countByStatusExceptions();

    @Query("SELECT COUNT(*) AS COUNT FROM fmr WHERE `status` = 'Rejected'")
    Long countByStatusRejected();

    @Query("SELECT COUNT(*) AS COUNT FROM fmr WHERE `status` IN ('Undertaking Approval Pending', 'Undertaking Recommendation')")
    Long countByStatusUnder();

    @Query("SELECT COUNT(*) AS COUNT FROM fmr WHERE `status` IN ('Payment Voucher Hand Over To Finance', 'Payment Voucher Hand Over To Finance(Undertaking Approval)')")
    Long countByStatusPayment();

    @Query("SELECT COUNT(*) AS COUNT FROM fmr WHERE `status` IN ('Completed', 'Completed(Undertaking Approval)')")
    Long countByStatusCompleted();
}
