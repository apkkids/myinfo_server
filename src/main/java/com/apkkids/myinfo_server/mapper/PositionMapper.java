package com.apkkids.myinfo_server.mapper;

import com.apkkids.myinfo_server.bean.Position;
import javafx.geometry.Pos;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface PositionMapper {
    public List<Position> getAllPositions();

    public Long deletePosition(@Param("did") Long did);

    public Long addPosition(@Param("pos") Position pos);
}
