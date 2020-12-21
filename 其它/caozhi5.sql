# 物料属性个数
SELECT *
FROM userdef_base
WHERE tenant_id = 0
  and classId = 'productArchive';


发事件url参数
{
    "domain":"ustock",
    "billnums":[
        "pc_product",
        "aa_goodsposition"
    ]
}