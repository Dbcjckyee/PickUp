Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "wuujnWIeQA4Vt7PGfUeKeUGjp", "IXPvx2EUVu22H9WcGT7jGN8uIAmH0kpte6jfjR34Y4QNDLm5Xg"
  provider :facebook, "1033432933375482", "bd16dbb3d27efa301e9ac9b6ebf99dac",
    scope: 'public_profile', info_fields: 'id,name,link'


end
