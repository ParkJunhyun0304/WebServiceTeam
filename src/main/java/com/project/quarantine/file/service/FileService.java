package com.project.quarantine.file.service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.quarantine.quarantine.vo.QuarantineVO;
import com.project.quarantine.symptom.service.SymptomService;
import com.project.quarantine.symptom.vo.SymptomVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public class FileService {

    @Autowired
    SymptomService symptomService;

    public QuarantineVO uploadData(HttpServletRequest req) {

        int size = 15 * 1024 * 1024; // 파일 최대크기 설정
        String realPath = req.getServletContext().getRealPath("upload");
        // httpservletrequest을 통해서 루트 디렉토리 경로를 가져오고, 여기에 /upload를 추가해 폴더 경로를 지정해줌

        System.out.println(realPath);
        File dir = new File(realPath); // 파일생성
        if(!dir.exists()){ // 만약 폴더가 없으면 새로 만듦
            dir.mkdirs(); // 폴더 만드는 명령어
            System.out.println("폴더 생성 성공");
        }

        try {
            MultipartRequest multipartRequest = new MultipartRequest(req, realPath, size, "utf-8", new DefaultFileRenamePolicy());
            // request가 MultipartRequest이기 때문에 MultipartRequest를 이용해서 request에 있는 file, String을 받을 수 있도록 한다.
            // 파라미터로는 requeset, 파일이 저장될 경로, 최대 사이즈, encoding type, 파일이 저장될 때 규칙이 들어간다.

            // 사용자 입력값 가져오기
            String originalImgName = multipartRequest.getFilesystemName("file"); // 업로드된 파일 이름
            if (originalImgName != null) {
                System.out.println("File name retrieved: " + originalImgName);
            } else {
                System.out.println("No file was uploaded.");
            }
            String name = multipartRequest.getParameter("name"); // 이름
            String passportId = multipartRequest.getParameter("passportId"); // 여권번호
            String birthDate = multipartRequest.getParameter("birthDate"); // 생일
            String nationality = multipartRequest.getParameter("nationality"); // 국적
            int gender = Integer.parseInt(multipartRequest.getParameter("gender")); // 성별
            String flightCode = multipartRequest.getParameter("flightCode"); // 항공코드
            String flightSeat = multipartRequest.getParameter("seatNumber"); // 좌석번호
            String contact = multipartRequest.getParameter("contact"); // 연락처
            String[] visitCountry = new String[]{multipartRequest.getParameter("visitCountry")}; // 방문국가
            int isHealthy = Integer.parseInt(multipartRequest.getParameter("isHealthy")); // 증상유무
            String note = multipartRequest.getParameter("note"); // 비고란
            String departure = multipartRequest.getParameter("departure"); // 출발국가
//            int createdBy = Integer.parseInt(multipartRequest.getParameter("createdBy")); // 생성한 user id

            String uuidFileName = renameImg(realPath, originalImgName);
            int symptomsId = symptomService.insertSymptom(req);
            String visitCountryString = String.join(",", visitCountry);

//            System.out.println(symptomsId + " " +birthDate  + " " + gender  + " " + name  + " " +passportId  + " " + nationality  + "\n" +
//                    flightCode  + " " + flightSeat  + " " + contact  + " " + note  + " " + visitCountryString  + " " + originalImgName  + " " + uuidFileName  + " " + departure  + " " + isHealthy);

            return new QuarantineVO(symptomsId,birthDate,gender,name,passportId,nationality,flightCode,flightSeat,contact,note,visitCountryString,originalImgName,uuidFileName,departure,isHealthy,0);
            // request에서 받은 데이터로 PostVO 객체를 생성해서 리턴함
        } catch (IOException e) {
            System.out.println("Error");
            throw new RuntimeException(e);
        }
    }

    public String renameImg(String realPath, String originalImgName) {
        // 파일 이름 UUID로 변경
        String extension = originalImgName.substring(originalImgName.lastIndexOf(".")); // 확장자 추출하기
        String uuidFileName = UUID.randomUUID().toString() + extension; // UUID 값으로 파일 이름 생성
        File oldFile = new File(realPath, originalImgName);
        File newFile = new File(realPath, uuidFileName);
        oldFile.renameTo(newFile); // 파일이름 변경하기
        return uuidFileName;
    }

}
