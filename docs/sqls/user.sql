CREATE TABLE "user" (
     id BIGSERIAL NOT NULL,
     uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
     email VARCHAR(256),
     nick_name CHARACTER VARYING(64),
     avatar_url CHARACTER VARYING(256),
     reg_way CHARACTER VARYING(32),
     tag_line CHARACTER VARYING(128),
     about_me CHARACTER VARYING(256),
     location CHARACTER VARYING(256),
     language CHARACTER VARYING(32),
     profile_public BOOLEAN DEFAULT True,
     visibility BOOLEAN DEFAULT True,
     prompts_num INTEGER DEFAULT 0,
     followers_num INTEGER DEFAULT 0,
     following_num INTEGER DEFAULT 0,
     disable_post BOOLEAN DEFAULT False,
     status CHARACTER VARYING(32) DEFAULT 'active',
     role  CHARACTER VARYING(32) DEFAULT 'normal',
     create_at TIMESTAMP WITH TIME ZONE,
     update_at TIMESTAMP WITH TIME ZONE,
     CONSTRAINT "public.user_pkey" PRIMARY KEY (id)
 );


COMMENT ON TABLE "user" IS '存储用户profile相关表'; -- 表注释
COMMENT ON COLUMN "user".id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN "user".uuid IS '用户UUID，最大长度为64个字符，不能为空且唯一';
COMMENT ON COLUMN "user".email IS '邮箱地址，最大长度为256个字符';
COMMENT ON COLUMN "user".nick_name IS '用户名称，最大长度为64个字符';
COMMENT ON COLUMN "user".avatar_url IS '头像在s3存储路径url，最大长度为256个字符';
COMMENT ON COLUMN "user".reg_way IS '用户注册渠道';
COMMENT ON COLUMN "user".tag_line IS '用户在定义tag_line属性';
COMMENT ON COLUMN "user".about_me IS '用户在定义about_me属性';
COMMENT ON COLUMN "user".location IS '用户在定义location属性';
COMMENT ON COLUMN "user".language IS '用户在定义language属性';
COMMENT ON COLUMN "user".profile_public IS '用户定义是否公开profile, 默认为True';
COMMENT ON COLUMN "user".visibility IS '用户定义是否公开和GPT的Conversation, 默认为True';
COMMENT ON COLUMN "user".prompts_num IS '用户创建的prompts 数量，创建/删除prompts时更新该数值， 默认0';
COMMENT ON COLUMN "user".followers_num IS '用户的follower 数量，用户被关注/取关时更新，默认0';
COMMENT ON COLUMN "user".following_num IS '用户follow 其它用户的数量，用户关注/取关其它用户时更新，默认0';
COMMENT ON COLUMN "user".disable_post IS '用户是否被禁止发帖或评论, 默认False';
COMMENT ON COLUMN "user".status IS '用户当前状态， active/deregister/banned， 默认active';
COMMENT ON COLUMN "user".create_at IS '用户注册时间，创建该数据时写入';
COMMENT ON COLUMN "user".update_at IS '更新时间，修改内容时变更';
COMMENT ON COLUMN "user".role IS '角色，用户角色，可选址 normal/admin';


CREATE INDEX idx_user_email ON "user" (email); -- email字段索引
