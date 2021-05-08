package RefunGarantee.Int221.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import RefunGarantee.Int221.Model.Color;

@Repository
public interface ColorRepository extends JpaRepository<Color,Long>{

}
