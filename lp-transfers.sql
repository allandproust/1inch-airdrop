-- LP Tokens Transfers
SELECT
  UNIX_SECONDS(block_timestamp) as time,
  address as token,
  '0x' || SUBSTR(topics[OFFSET(1)], 27) as sender,
  '0x' || SUBSTR(topics[OFFSET(2)], 27) as receiver,
  data as amount
FROM `bigquery-public-data.crypto_ethereum.logs`
WHERE ARRAY_LENGTH(topics) > 0 AND topics[OFFSET(0)] = '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef' -- Transfer(address,address,uint256)
AND address IN (
    -- All Pools
    '0x61bb2fda13600c497272a8dd029313afdb125fd3',
    '0x75116bd1ab4b0065b44e1a4ea9b4180a171406ed',
    '0x377d0c7ecf3f94968bcbf85de863282cae997b45',
    '0x33440a6139a550cd68ba21cdafa3241f10041d26',
    '0xbeabef3fc02667d8bd3f702ae0bb2c4edb3640cc',
    '0x322a1e2e18fffc8d19948581897b2c49b3455240',
    '0x16ce81cfc20ce5ae4ab57a012e29ac067deed501',
    '0x4c84763c29ee86846f7b4e9cb8ea7884bbd405d5',
    '0xd1f905114005ec02585b0ba22a691344c6289d3e',
    '0x3863fc8c1cc59f160280f5d3e4c1a4c63f945ce3',
    '0xf95b6d2fb99f742e4bf0ec2cfe8f20c18cdd7c28',
    '0x296f09d5632487970664c62516d999d8eac8d8c8',
    '0xed2c5bac5baedb7a59f8711659294ae3eef656e5',
    '0x03dfd032c9f7bff5517c9307da100e738dfad75b',
    '0xdfac4e58bdf6691562fc5fec6d9afc5d8111e076',
    '0x7f5d53d3bcc1b37a0c5fbd127d697f923e82cbb2',
    '0x43385366ed8775dd541f96df9950770e95ed060b',
    '0x3a5e247d1b931347ef6e75a11b28bc5bfb4f608e',
    '0x3062938bad00a2355dab2ce11462b615a49e736d',
    '0x6094bed8dd8ab2e58eed0933b34c60928080d4dc',
    '0x374fd7802c9d350e1a83042f2a8ee3fdb2f6260c',
    '0x8ed36239072eaac6d5f174718c16b07e36a2491d',
    '0xdf42c6efc7ff03aa1c758ef7f678167f050a884e',
    '0x8c412a045dd7546f7f44fec5fcaf1f38ca10e66b',
    '0x727ec29ef1c78f93829d886474d8eb58c1450f80',
    '0x31631b3dd6c697e574d6b886708cd44f5ccf258f',
    '0xb91b439ff78531042f8eaaecaa5ecf3f88b0b67c',
    '0x2d5786b5cf47627f5c58e2026b80d7d56a296cea',
    '0x0e8f25fd45eee90733c46853bcc8b05494e10573',
    '0xe435cb6aca58dc49bda79753eed8c0fa6ed96e5d',
    '0xe5a6c0421388e4249f10da95c9094bde485a885b',
    '0x5b1fc2435b1f7c16c206e7968c0e8524ec29b786',
    '0x3426e78ecc79bf80910a808f1a90202972afda43',
    '0xeb94721976095d0b520d3c1028435fe6f5fa3acd',
    '0xb5ffd0a221fc94de9255382e70ce1aec76b68c89',
    '0xd4f0f8483ad1428477176a19df848c43f5ee9c44',
    '0x22c994e20f0944aa930f0fb0714c43a4e469ab62',
    '0x798934cdcfae18764ef4819274687df3fb24b99b',
    '0x3d0a8e6300a5a4094238003c3e875bda6c971f77',
    '0x18e9a09aed68f53f904a98b459420b1cee909d9e'
)
ORDER BY block_timestamp, transaction_index, log_index
