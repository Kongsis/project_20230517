package com.icia.bookstore.service;

import com.icia.bookstore.dto.PageDTO;
import com.icia.bookstore.dto.ProductDTO;
import com.icia.bookstore.dto.ProductFileDTO;
import com.icia.bookstore.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public void save(ProductDTO productDTO) throws IOException {
        if (productDTO.getProductFile().get(0).isEmpty()) {
            productDTO.setFileAttached(0);
            productRepository.save(productDTO);
        } else {
            productDTO.setFileAttached(1);
            ProductDTO dto = productRepository.save(productDTO);
            for (MultipartFile productFile : productDTO.getProductFile()) {
                String originalFilename = productFile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                ProductFileDTO productFileDTO = new ProductFileDTO();
                productFileDTO.setOriginalFileName(originalFilename);
                productFileDTO.setStoredFileName(storedFileName);
                productFileDTO.setProductId(dto.getId());
                String savePath = "D:\\springframework_img\\" + storedFileName;
                productFile.transferTo(new File(savePath));
                productRepository.saveFile(productFileDTO);
            }
        }
    }
    public List<ProductDTO> findAll() {
        return productRepository.findAll();
    }
    public List<ProductDTO> pagingList(int page) {
        int pageLimit = 5;
        int pagingStart = (page-1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("Limit", pageLimit);
        List<ProductDTO> productDTOList = productRepository.pagingList(pagingParams);
        return productDTOList;
    }
    public PageDTO pagingParam(int page) {
        int pageLimit = 5;
        int blockLimit = 3;
        int productCount = productRepository.boardCount();
        int maxPage = (int)(Math.ceil((double)productCount / pageLimit));
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        int endPage = startPage + blockLimit -1;
        if(endPage > maxPage){
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }
    public void updateHits(Long id) {
        productRepository.updateHits(id);
    }
    public ProductDTO findById(Long id) {
        return productRepository.findById(id);
    }
    public List<ProductFileDTO> findFile(Long id) {
        return productRepository.findFile(id);
    }

    public void update(ProductDTO productDTO) {
        productRepository.update(productDTO);
    }

    public void delete(Long id) {
        productRepository.delete(id);
    }
    public List<ProductDTO> searchList(int page, String type, String q) {
        int pageLimit = 5;
        int pagingStart = (page-1) * pageLimit;
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        pagingParams.put("q", q);
        pagingParams.put("type", type);
        List<ProductDTO> productDTOList = productRepository.searchList(pagingParams);
        return productDTOList;
    }

    public PageDTO pagingSearchParam(int page, String type, String q) {
        int pageLimit = 5;
        int blockLimit = 3;
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("q", q);
        pagingParams.put("type", type);
        int productCount = productRepository.productSearchCount(pagingParams);
        int maxPage = (int) (Math.ceil((double)productCount / pageLimit));
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }
}
