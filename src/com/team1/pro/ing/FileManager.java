package com.team1.pro.ing;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

public class FileManager
{
	// 파일 다운로드
	// ·saveFileName : 서버에 저장된 파일명
	// ·originalFileName : 클라이언트가 업로드한 파일명
	// ·path : 서버에 저장된 경로
	public static boolean doFileDownload(String saveFileName, String originalFileName, String path, HttpServletResponse response)
	{
		// 경로 구성
		// → 매개변수로 넘겨받은 path + 구분자 + 서버에 저장된 파일명
		String load_dir = path + File.separator + saveFileName;
		
		try
		{
			if (originalFileName == null || originalFileName.equals(""))
			{
				originalFileName = saveFileName;
			}
			
			//originalFileName = new String(originalFileName.getBytes("UTF-8"), "UTF-8");
			
			originalFileName = new String(originalFileName.getBytes("euc-kr"), "8859_1");
			
		}
		catch (UnsupportedEncodingException e)	// checked Exception
		{
			System.out.println(e.toString());
		}
		
		try
		{
			// 파일 객체 생성
			File file = new File(load_dir);
			
			if (file.exists())
			{
				byte readByte[] = new byte[4096];	// 4 * 1024
				
				// 응답 객체 관련 헤더 구성
				// 대표적으로 '쿠키' 가 있음.
				response.setContentType("application/octet-stream"); // contentType 이라는 건 데이터를 주고받는 과정에 있어서 지금 주고받고 있는 데이터가 어떤것인지를 알려주는 역할이기 때문에 매우 중요하다.
																	 // 데이터는 주고받는 과정에서 조각나서 교환되기 때문에 더욱 중요!!
				response.setHeader("Content-disposition", "attachment;filename=" + originalFileName);
				
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				
				OutputStream outs = response.getOutputStream();	// 자바는 단일 입출력이기 때문에 이놈을 쓰고 있는 동안 다른놈들은 못써.
																// 얘는 자바내에 있는 인스턴스를 취해서 쓰는 것이지 우리가 만드는 개념이 아님.
				
				int read;
				while ((read = fin.read(readByte, 0, 4096)) != -1)
				{
					outs.write(readByte, 0, read);
				}

				outs.flush();
				outs.close();
				fin.close();
				
				return true;
				
			}
			
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		return false;
		
	}
	
}
