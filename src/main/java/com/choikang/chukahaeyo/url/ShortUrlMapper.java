package com.choikang.chukahaeyo.url;

import com.choikang.chukahaeyo.url.model.ShortUrlVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface ShortUrlMapper {
    Optional<ShortUrlVO> findByOriginUrl(String originUrl);
    Optional<ShortUrlVO> findByShortUrl(String shortUrl);

    void save(ShortUrlVO shortUrlVO);
    void delete(ShortUrlVO shortUrlVO);
}

