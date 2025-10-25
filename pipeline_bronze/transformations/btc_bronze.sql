CREATE OR REFRESH STREAMING LIVE TABLE bitcoin
TBLPROPERTIES ("quality" = "bronze") 
AS
-- Lê os arquivos JSON da pasta RAW usando cloud_files (Auto Loader)
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse/raw/coinbase/coinbase/bitcoin/',  -- caminho de origem
  'json',
  map(
    'cloudFiles.includeExistingFiles', 'false',
    'cloudFiles.inferColumnTypes', 'true',
    'cloudFiles.schemaEvolutionMode', 'addNewColumns'
  )
);