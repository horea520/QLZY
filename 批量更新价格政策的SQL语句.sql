
drop index YXJGZCB	on YXJGZCB
go

TRUNCATE TABLE  YXJGZCBM 
GO
INSERT INTO YXJGZCBM(YXJGZCBM_ID,YXJGZCBM_GSID,YXJGZCBM_QDLX,YXJGZCBM_SYB,YXJGZCBM_BM,YXJGZCBM_KHBH,YXJGZCBM_ZCLX,YXJGZCBM_LY,YXJGZCBM_LYLS)
--销售公司、渠道类型、区域、客户、政策类型、制单人、制单日期,
SELECT NEWID()F_ID, ISNULL(YXJGZCB_GSID,''),ISNULL(YXJGZCB_UFQDLX,''),ISNULL(YXJGZCB_SYB,''),ISNULL(YXJGZCB_BM,''),ISNULL(YXJGZCB_KHBH,''),ISNULL(YXJGZCB_UF_ZCLX,''),ISNULL(YXJGZCB_LY,'')
 FROM YXJGZCB  GROUP BY ISNULL(YXJGZCB_GSID,''),ISNULL(YXJGZCB_UFQDLX,''),ISNULL(YXJGZCB_SYB,''),ISNULL(YXJGZCB_BM,''),ISNULL(YXJGZCB_KHBH,''),ISNULL(YXJGZCB_UF_ZCLX,''),ISNULL(YXJGZCB_LY,''),ISNULL(YXJGZCBM_LYLS,'')
 GO
 ALTER TABLE YXJGZCB ADD YXJGZCB_IDBAK VARCHAR(40)
 GO
 UPDATE YXJGZCB SET YXJGZCB_IDBAK=NEWID()

 GO
 UPDATE YXJGZCB SET YXJGZCB_ID=YXJGZCBM_ID FROM YXJGZCBM WHERE ISNULL(YXJGZCBM_GSID,'')=ISNULL(YXJGZCB_GSID,'') AND ISNULL(YXJGZCBM_QDLX,'')=ISNULL(YXJGZCB_UFQDLX,'') AND ISNULL(YXJGZCBM_SYB,'')=ISNULL(YXJGZCB_SYB,'') AND ISNULL(YXJGZCBM_BM,'')=ISNULL(YXJGZCB_BM,'')
 AND ISNULL(YXJGZCBM_KHBH,'')=ISNULL(YXJGZCB_KHBH,'') AND ISNULL(YXJGZCBM_ZCLX,'')=isnull(YXJGZCB_UF_ZCLX,'') AND isnull(YXJGZCBM_LY,'')=isnull(YXJGZCB_LY,'')AND isnull(YXJGZCBM_LYLS,'')=isnull(YXJGZCBM_LYLS,'')

 GO

 UPDATE YXJGZCB SET YXJGZCB_FLBH=F_FLBH FROM (  select YXJGZCB_IDBAK,   RIGHT('000000'+CAST(ROW_NUMBER() over(partition by YXJGZCB_ID order by YXJGZCB_ID desc) AS VARCHAR),4) F_FLBH FROM YXJGZCB) LSB WHERE LSB.YXJGZCB_IDBAK=YXJGZCB.YXJGZCB_IDBAK

 GO


create INDEX YXJGZCB ON  YXJGZCB(YXJGZCB_ID,YXJGZCB_FLBH )
GO
