<%-- 
    Document   : UserUploadAction.jsp
    Created on : Jan 17, 2020, 11:36:21 AM
    Author     : appu
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citizen</title>
    </head>
    <body>
        <%
            
        File savedFile=null; 
        FileItem f_item=null;
        
        

String field_name="";
String file_name="";
String fn="";
String logo="";
String proof="";


String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                
                k++;
        }
       else
       {
		   
		   
           //f_item=(FileItem)itr.next();
            
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("clogo"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Assets\\Companylogo\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            logo="cmplogo_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+logo);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           if(field_name.equals("cproof"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Assets\\Companyproof\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            proof="cmpproof_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+proof);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
       }
           
           }
    
String s="select * from tbl_branch where branch_username='"+value[9]+"'";
    ResultSet r=con.selectCommand(s);
    String st="select * from tbl_company where company_username='"+value[6]+"'";
    ResultSet rt=con.selectCommand(st);
    String str="select * from tbl_shop where shop_username='"+value[8]+"'";
    ResultSet rs=con.selectCommand(str);
    if(r.next())
    {
      %> 
      <script type="text/javascript">
            alert("Username already exists");
            setTimeout(function(){window.location.href='../../Guest/Landlord.jsp'},100);
        </script>
     <%  
    }
    else if(rt.next())
    {
      %> 
      <script type="text/javascript">
            alert("Username already exists");
            setTimeout(function(){window.location.href='../../Guest/Landlord.jsp'},100);
        </script>
     <%  
    }
    else if(rs.next())
    {
      %> 
      <script type="text/javascript">
            alert("Username already exists");
            setTimeout(function(){window.location.href='../../Guest/Company.jsp'},100);
        </script>
     <%  
    }
    
    else
    {
    }
    //Strinh str1="insert into tbl_wantedlist ()";
    if(value[7].equals(value[8]))
    {
        String str1="insert into tbl_company(company_name,company_contact,company_email,district_id,company_address,company_logo,company_licno,company_proof,company_username,company_password,company_doj)values('"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"',+'"+logo+"','"+value[5]+"','"+proof+"','"+value[6]+"','"+value[7]+"',curdate())";
  //System.out.println(str1);
  out.println(str1);
    
   
    boolean status=con.executeCommand(str1);
    
    if(status==true)
    {
      %> 
      <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='../../Guest/Company.jsp'},100);
        </script>
     <%
    
     } 
    }

else
    {
    %>
    <script>alert("password mismatch");</script>
     <%  
    }
    }
        %>
    </body>
</html>
