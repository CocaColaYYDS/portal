CREATE TABLE IF NOT EXISTS apigw_gportal_api (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL,
      api_name varchar(255) NOT NULL ,
      api_path varchar(255) NOT NULL ,
      api_method varchar(255) NOT NULL ,
      description text,
      type varchar(255) NOT NULL ,
      service_id bigint(20) NOT NULL ,
      status varchar(255) NOT NULL DEFAULT '0' ,
      regex varchar(255) DEFAULT NULL,
      document_status_id bigint(20) DEFAULT '0' ,
      request_example_value text,
      response_example_value text,
      alias_name varchar(128) DEFAULT NULL ,
      project_id bigint(11) DEFAULT NULL ,
      sync_status tinyint(2) DEFAULT '0' ,
      ext_api_id bigint(20) DEFAULT NULL ,
      swagger_sync tinyint(2) DEFAULT '0' ,
      PRIMARY KEY (id)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_api_document_status (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      status varchar(255) NOT NULL ,
      PRIMARY KEY (id)
    )  ;

    insert into apigw_gportal_api_document_status (status)
    values
      ('开发中'),
      ('联调中'),
      ('提测中'),
      ('已上线');





 CREATE TABLE IF NOT EXISTS apigw_gportal_api_model (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      model_name varchar(255) NOT NULL ,
      description varchar(255) DEFAULT NULL ,
      type tinyint(11) DEFAULT NULL ,
      format tinyint(11) DEFAULT NULL ,
      service_id bigint(20) NOT NULL ,
      swagger_sync tinyint(2) DEFAULT '0' ,
      project_id bigint(20) DEFAULT NULL,
      PRIMARY KEY (id),
      KEY index_model_id (id)
    )  ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_api_proxy (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) NOT NULL ,
      modify_date bigint(20) DEFAULT NULL,
      api_id bigint(11) NOT NULL ,
      gw_id bigint(11) NOT NULL,
      service_id bigint(11) DEFAULT NULL,
      traffic_control_policy_id bigint(11) DEFAULT '0' ,
      time_range varchar(255) DEFAULT NULL ,
      project_id bigint(11) DEFAULT NULL ,
      PRIMARY KEY (id)
    )  ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_api_status_code (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      error_code varchar(255) DEFAULT NULL,
      message varchar(255) DEFAULT NULL,
      status_code bigint(20) DEFAULT NULL ,
      object_id bigint(20) DEFAULT NULL,
      type varchar(255) NOT NULL,
      description text ,
      PRIMARY KEY (id),
      KEY index_api_id (object_id)
    ) ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_body_param (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL,
      api_id bigint(11) NOT NULL ,
      param_name varchar(255) NOT NULL ,
      required varchar(20) NOT NULL DEFAULT '0' ,
      def_value varchar(255) DEFAULT NULL ,
      description varchar(255) DEFAULT NULL ,
      type varchar(255) NOT NULL ,
      param_type_id bigint(20) DEFAULT NULL,
      array_data_type_id bigint(20) DEFAULT NULL,
      association_type varchar(63) DEFAULT 'NORMAL' ,
      PRIMARY KEY (id)
    )  ;




 CREATE TABLE IF NOT EXISTS apigw_gportal_dubbo_param (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date timestamp NOT NULL DEFAULT NULL ,
      api_id bigint(11) NOT NULL ,
      param_name varchar(255) NOT NULL ,
      required varchar(20) NOT NULL DEFAULT '0' ,
      def_value varchar(255) DEFAULT NULL ,
      description varchar(255) DEFAULT NULL ,
      dubbo_type varchar(255) NOT NULL ,
      param_type_id bigint(20) DEFAULT NULL,
      array_data_type_id bigint(20) DEFAULT NULL,
      param_sort tinyint(4) NOT NULL DEFAULT '0' ,
      param_alias varchar(255) DEFAULT NULL ,
      PRIMARY KEY (id)
    )  ;


 CREATE TABLE IF NOT EXISTS apigw_gportal_grpc_param (
    id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    create_date bigint(11) DEFAULT NULL ,
    modify_date bigint(11) DEFAULT NULL ,
    api_id bigint(11) NOT NULL ,
    service_id bigint(11) NOT NULL ,
    pb_name varchar(255) NOT NULL DEFAULT '' ,
    pb_package_name varchar(255) NOT NULL DEFAULT '' ,
    pb_service_name varchar(255) NOT NULL DEFAULT '' ,
    pb_method_name varchar(255) NOT NULL DEFAULT '' ,
    PRIMARY KEY (id),
    KEY api_id (api_id),
    KEY pb_name (pb_name)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_header_param (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL,
      api_id bigint(20) NOT NULL ,
      param_name varchar(255) NOT NULL ,
      param_value varchar(255) DEFAULT NULL ,
      description varchar(255) DEFAULT NULL ,
      type varchar(255) NOT NULL ,
      PRIMARY KEY (id)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_gateway_info (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      gw_name varchar(255) NOT NULL ,
      gw_addr varchar(255) NOT NULL ,
      description varchar(255) DEFAULT NULL,
      create_date bigint(20) DEFAULT NULL,
      modify_date bigint(20) DEFAULT NULL ,
      status int(11) DEFAULT '1',
      last_check_time bigint(20) DEFAULT '0',
      health_interface_path varchar(255) DEFAULT NULL ,
      mongo_addr varchar(255) DEFAULT NULL ,
      project_id text ,
      env_id varchar(128) DEFAULT NULL ,
      auth_addr varchar(128) DEFAULT NULL ,
      audit_datasource_switch varchar(255) DEFAULT NULL ,
      mysql_addr text ,
      gw_uni_id varchar(128) DEFAULT NULL ,
      metric_url varchar(255) DEFAULT NULL ,
      api_plane_addr varchar(255) DEFAULT NULL ,
      gw_cluster_name varchar(255) DEFAULT NULL ,
      gw_type varchar(20) DEFAULT 'g0' ,
      audit_addr varchar(255) DEFAULT NULL ,
      prom_addr varchar(255) DEFAULT NULL ,
      audit_db_config varchar(1024) DEFAULT NULL ,
      camel_addr VARCHAR(255) DEFAULT NULL,
      PRIMARY KEY (id)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_model_param (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL,
      model_id varchar(255) NOT NULL ,
      param_name varchar(255) NOT NULL ,
      param_type_id bigint(11) NOT NULL ,
      array_data_type_id bigint(20) DEFAULT NULL,
      object_id bigint(20) DEFAULT NULL,
      def_value varchar(255) DEFAULT NULL ,
      description varchar(255) DEFAULT NULL ,
      required varchar(20) NOT NULL DEFAULT '0',
      PRIMARY KEY (id),
      KEY index_model_param_id (id)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_operation_log (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      email varchar(255) DEFAULT NULL ,
      object_id bigint(20) DEFAULT NULL ,
      operation text ,
      type varchar(255) DEFAULT NULL ,
      PRIMARY KEY (id),
      KEY index_object_id (object_id,type)
    ) ;




 CREATE TABLE IF NOT EXISTS apigw_gportal_param_object (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(11) DEFAULT NULL ,
      object_value varchar(1024) DEFAULT NULL ,
      PRIMARY KEY (id),
      KEY index_param_object_id (id)
    )  ;




 CREATE TABLE IF NOT EXISTS apigw_gportal_param_type (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL,
      param_type varchar(255) NOT NULL ,
      location varchar(255) NOT NULL ,
      model_id bigint(20) DEFAULT '0',
      PRIMARY KEY (id)
    )  ;

    insert into apigw_gportal_param_type (create_date, modify_date, param_type, location, model_id)
    values
      ( 1515548961293, 1515548961293, 'String', 'BODY', 0),
      ( 1515548961293, 1515548961293, 'Content-Type', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Accept-Language', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Array', 'BODY', 0),
      ( 1515548961293, 1515548961293, 'Boolean', 'BODY', 0),
      ( 1515548961293, 1515548961293, 'File', 'BODY', 0),
      ( 1515548961293, 1515548961293, 'Number', 'BODY', 0),
      ( 1515548961293, 1515548961293, 'Object', 'BODY', 0),
      ( 1515548961293, 1515548961293, 'Variable', 'BODY', 0),
      ( 1515548961293, 1515548961293, 'Accept-Charset', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Accept', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Accept-Encoding', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Accept-Datetime', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Authorization', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Cache-Control', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Connection', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Cookie', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Content-Disposition', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Content-Length', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Content-MD5', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Date', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Expect', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'From', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Host', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'If-Match', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'If-Modified-Since', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'If-None-Match', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'If-Range', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'If-Unmodified-Since', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Max-Forwards', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Origin', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Pragma', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Proxy-Authorization', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Range', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Referer', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'TE', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'User-Agent', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Upgrade', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Via', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'Warning', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'X-Requested-With', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'DNT', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'X-Forwarded-For', 'HEADER', 0),
      ( 1515548961293, 1515548961293, 'X-Forwarded-Host', 'HEADER', 0),
      ( 1515548961291, 1515548961293, 'Int', 'BODY', 0),
      ( 1515548961291, 1515548961293, 'Long', 'BODY', 0),
      ( 1515548961291, 1515548961293, 'Double', 'BODY', 0),
      ( 1515548961291, 1515548961293, 'Float', 'BODY', 0);





 CREATE TABLE IF NOT EXISTS apigw_gportal_plugin (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      gw_id bigint(20) DEFAULT NULL ,
      plugin_name varchar(255) DEFAULT NULL ,
      plugin_version varchar(255) DEFAULT NULL ,
      plugin_file_name varchar(255) DEFAULT NULL ,
      plugin_content text ,
      plugin_variable text ,
      plugin_status int(11) DEFAULT NULL ,
      last_start_time bigint(20) DEFAULT NULL ,
      plugin_starting_time bigint(11) DEFAULT NULL ,
      plugin_call_number bigint(11) DEFAULT NULL ,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_gportal_registry_center (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      registry_type varchar(255) NOT NULL ,
      registry_addr varchar(255) NOT NULL ,
      registry_alias varchar(255) DEFAULT NULL ,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(11) DEFAULT NULL ,
      project_id bigint(20) NULL,
      is_shared tinyint(4) NULL,
      gw_id BIGINT(20) NULL,
      PRIMARY KEY (id)
    )  ;

 CREATE TABLE IF NOT EXISTS apigw_gportal_service (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(11) DEFAULT NULL ,
      display_name varchar(255) NOT NULL,
      service_name varchar(255) DEFAULT NULL ,
      contacts varchar(255) DEFAULT NULL ,
      description varchar(255) DEFAULT NULL ,
      status int(11) NOT NULL DEFAULT '0' ,
      health_interface_path varchar(255) DEFAULT NULL ,
      service_type varchar(63) DEFAULT NULL ,
      project_id bigint(11) DEFAULT NULL ,
      wsdl_url varchar(255) DEFAULT NULL ,
      sync_status tinyint(2) DEFAULT '0' ,
      ext_service_id bigint(20) DEFAULT NULL ,
      PRIMARY KEY (id)
    ) ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_service_instance (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      service_id bigint(11) NOT NULL ,
      gw_id bigint(20) NOT NULL ,
      service_addr varchar(255) DEFAULT NULL ,
      status int(11) unsigned NOT NULL DEFAULT '1' ,
      last_check_time bigint(20) NOT NULL DEFAULT '0' ,
      registry_center_addr varchar(511) DEFAULT NULL ,
      PRIMARY KEY (id)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_service_lb (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      service_id bigint(20) DEFAULT NULL,
      gw_id bigint(20) DEFAULT NULL,
      service_addr varchar(255) NOT NULL ,
      weight int(11) NOT NULL ,
      status int(11) DEFAULT '1',
      last_check_time bigint(20) DEFAULT '0',
      PRIMARY KEY (id)
    )  ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_service_lb_rule (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      service_id bigint(11) NOT NULL ,
      gw_id bigint(20) NOT NULL ,
      shunt_way varchar(255) NOT NULL DEFAULT '' ,
      instance_weight_list text ,
      param_shunt_type varchar(255) DEFAULT '' ,
      param_type varchar(255) DEFAULT '' ,
      param_name varchar(255) DEFAULT '' ,
      modulus_threshold int(11) DEFAULT NULL ,
      item_list text ,
      regex int(11) DEFAULT NULL ,
      instance_list text ,
      rule_name varchar(255) DEFAULT NULL ,
      PRIMARY KEY (id)
    )  ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_service_lb_rule_binding (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      rule_id bigint(20) NOT NULL ,
      gw_id bigint(20) NOT NULL ,
      service_id bigint(20) NOT NULL ,
      binding_time bigint(20) NOT NULL ,
      PRIMARY KEY (id)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_service_lb_rule_multi (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      service_id bigint(11) NOT NULL ,
      rule_name varchar(255) DEFAULT NULL ,
      shunt_way varchar(255) DEFAULT NULL ,
      param_matching_mode varchar(255) DEFAULT NULL ,
      param_type varchar(255) DEFAULT NULL ,
      param_name varchar(255) DEFAULT NULL ,
      instance_type varchar(255) DEFAULT NULL ,
      instance_list text ,
      color varchar(255) DEFAULT NULL ,
      PRIMARY KEY (id),
      KEY service_id (service_id)
    )  ;


 CREATE TABLE IF NOT EXISTS apigw_gportal_service_protobuf (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      service_id bigint(11) unsigned NOT NULL ,
      pb_name varchar(255) NOT NULL DEFAULT '' ,
      pb_file_name varchar(255) NOT NULL DEFAULT '' ,
      pb_file_content text NOT NULL ,
      desc_file_content text NOT NULL ,
      description varchar(255) DEFAULT NULL ,
      pb_status int(11) NOT NULL DEFAULT '0' ,
      PRIMARY KEY (id)
    )  ;


 CREATE TABLE IF NOT EXISTS apigw_gportal_service_protobuf_proxy (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL ,
      modify_date bigint(20) DEFAULT NULL ,
      pb_id bigint(20) NOT NULL ,
      gw_id bigint(20) NOT NULL ,
      PRIMARY KEY (id),
      KEY pb_id (pb_id)
    )  ;




 CREATE TABLE IF NOT EXISTS apigw_gportal_service_proxy (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) NOT NULL ,
      modify_date bigint(20) DEFAULT NULL,
      service_id bigint(11) NOT NULL ,
      gw_id bigint(11) NOT NULL ,
      service_addr text ,
      time_range varchar(255) DEFAULT NULL,
      class_name varchar(255) DEFAULT NULL,
      flow_replication_addr varchar(255) DEFAULT NULL,
      authentication tinyint(4) DEFAULT '1',
      shunt_way varchar(255) DEFAULT NULL ,
      shunt_switch int(11) DEFAULT '0' ,
      project_id bigint(11) DEFAULT NULL ,
      addr_acquire_strategy varchar(64) DEFAULT NULL ,
      registry_center_addr varchar(255) DEFAULT NULL ,
      application_name varchar(255) DEFAULT NULL ,
      transparent tinyint(1) DEFAULT '0' ,
      custom_header varchar(4000) DEFAULT NULL ,
      registry_center_type varchar(255) DEFAULT NULL ,
      adapt_service_name int(4) DEFAULT '0' ,
      PRIMARY KEY (id)
    )  ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_webservice_param (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(11) DEFAULT NULL ,
      modify_date bigint(11) DEFAULT NULL ,
      api_id bigint(11) NOT NULL ,
      param_name varchar(255) NOT NULL ,
      param_type varchar(255) DEFAULT NULL ,
      type varchar(255) DEFAULT NULL ,
      param_type_id bigint(20) unsigned DEFAULT NULL,
      array_data_type_id bigint(20) DEFAULT NULL,
      param_sort int(11) NOT NULL DEFAULT '0' ,
      description varchar(255) DEFAULT NULL ,
      PRIMARY KEY (id)
    ) ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_white_list (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      policy_name varchar(127) NOT NULL DEFAULT '' ,
      policy_type varchar(63) NOT NULL DEFAULT '' ,
      white_list text NOT NULL ,
      create_time bigint(11) NOT NULL DEFAULT '0' ,
      update_time bigint(11) NOT NULL DEFAULT '0' ,
      project_id varchar(127) NOT NULL ,
      PRIMARY KEY (id)
    ) ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_white_list_binding (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      gw_id bigint(11) NOT NULL ,
      policy_id bigint(11) NOT NULL DEFAULT '0' ,
      binding_time bigint(11) NOT NULL DEFAULT '0' ,
      binding_object_id varchar(127) NOT NULL DEFAULT '' ,
      binding_object_type varchar(63) NOT NULL DEFAULT '' ,
      project_id varchar(127) NOT NULL ,
      policy_name varchar(127) NOT NULL DEFAULT '' ,
      binding_object_name varchar(127) NOT NULL DEFAULT '' ,
      PRIMARY KEY (id)
    ) ;






 CREATE TABLE IF NOT EXISTS apigw_gportal_traffic_control_binding (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      api_id bigint(11) NOT NULL ,
      policy_id bigint(11) NOT NULL ,
      binding_time bigint(11) NOT NULL ,
      gw_id bigint(11) NOT NULL ,
      gateway_name varchar(128) NOT NULL DEFAULT '' ,
      policy_name varchar(128) NOT NULL DEFAULT '' ,
      project_id varchar(20) DEFAULT NULL ,
      PRIMARY KEY (id),
      KEY idx_api_id (api_id),
      KEY idx_policy_id (policy_id)
    ) ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_traffic_control_dimension (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      traffic_control_policy_id bigint(11) NOT NULL ,
      slot bigint(11) NOT NULL ,
      unit varchar(128) NOT NULL ,
      dimension_limit bigint(11) NOT NULL ,
      capacity bigint(11) NOT NULL ,
      dimension_type varchar(64) NOT NULL ,
      param_name varchar(128) DEFAULT NULL ,
      match_mode varchar(128) DEFAULT NULL ,
      param_value varchar(2048) DEFAULT NULL ,
      PRIMARY KEY (id),
      KEY idx_traffic_control_policy_id (traffic_control_policy_id)
    ) ;





 CREATE TABLE IF NOT EXISTS apigw_gportal_traffic_control_policy (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      name varchar(128) NOT NULL ,
      create_time bigint(20) NOT NULL ,
      update_time bigint(20) NOT NULL ,
      project_id varchar(20) DEFAULT NULL ,
      PRIMARY KEY (id)
    ) ;



 CREATE TABLE IF NOT EXISTS apigw_envoy_health_check_rule (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_time bigint(20) NOT NULL ,
      update_time bigint(20) NOT NULL ,
      service_id bigint(20) NOT NULL ,
      gw_id bigint(20) NOT NULL ,
      active_switch tinyint(4) NOT NULL ,
      path varchar(255) DEFAULT '' ,
      timeout int(11) DEFAULT NULL ,
      expected_statuses varchar(255) DEFAULT '' ,
      healthy_interval int(11) DEFAULT NULL ,
      healthy_threshold int(11) DEFAULT NULL ,
      unhealthy_interval int(11) DEFAULT NULL ,
      unhealthy_threshold int(11) DEFAULT NULL ,
      passive_switch tinyint(4) NOT NULL ,
      consecutive_errors int(11) DEFAULT NULL ,
      base_ejection_time int(11) DEFAULT NULL ,
      max_ejection_percent tinyint(4) DEFAULT NULL ,
      min_health_percent tinyint(4) DEFAULT 50 ,
      PRIMARY KEY (id),
      UNIQUE KEY unique_service_gw_id (service_id,gw_id),

      KEY index_service_gw_id (service_id,gw_id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_plugin_binding (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      plugin_type varchar(255) NOT NULL ,
      binding_object_type varchar(255) NOT NULL ,
      binding_object_id varchar(255) NOT NULL ,
      plugin_configuration text NOT NULL ,
      create_time bigint(20) NOT NULL ,
      update_time bigint(20) NOT NULL ,
      gw_id bigint(11) NOT NULL ,
      project_id bigint(11) NOT NULL ,
      plugin_priority bigint(11) NOT NULL ,
      template_id bigint(20) DEFAULT '0' ,
      template_version bigint(20) DEFAULT '0',
      binding_status varchar(127) NOT NULL DEFAULT 'enable' ,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_plugin_info (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      plugin_name varchar(255) NOT NULL ,
      plugin_type varchar(255) NOT NULL ,
      author varchar(255) NOT NULL ,
      create_time bigint(20) NOT NULL ,
      update_time bigint(20) NOT NULL ,
      plugin_scope varchar(255) NOT NULL ,
      instruction_for_use text NOT NULL ,
      plugin_schema text NOT NULL ,
      plugin_handler text NOT NULL ,
      plugin_priority bigint(11) NOT NULL ,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_route_rule (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      service_id varchar(11) DEFAULT NULL ,
      route_rule_name varchar(255) NOT NULL ,
      uri varchar(1024) NOT NULL ,
      method varchar(1024) DEFAULT NULL ,
      header text ,
      query_param text ,
      host varchar(1024) DEFAULT NULL ,
      priority bigint(11) DEFAULT NULL ,
      orders bigint(11) DEFAULT NULL ,
      project_id bigint(11) DEFAULT NULL ,
      publish_status int(4) DEFAULT '0' ,
      create_time bigint(20) NOT NULL DEFAULT '0' ,
      update_time bigint(20) NOT NULL DEFAULT '0' ,
      description varchar(255) DEFAULT NULL ,
      route_rule_source varchar(255) NULL ,
      header_operation varchar(1024) NULL ,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_route_rule_proxy (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      route_rule_id bigint(11) NOT NULL ,
      gw_id bigint(11) NOT NULL ,
      destination_services varchar(1024) NOT NULL ,
      project_id bigint(11) NOT NULL ,
      priority bigint(11) DEFAULT NULL ,
      orders bigint(11) DEFAULT NULL ,
      enable_state varchar(10) DEFAULT 'enable' ,
      create_time bigint(20) NOT NULL DEFAULT '0' ,
      update_time bigint(20) NOT NULL DEFAULT '0' ,
      service_id bigint(11) DEFAULT NULL ,
      hosts text ,
      timeout bigint(11) DEFAULT '60000' ,
      http_retry text ,
      virtual_cluster  text DEFAULT NULL ,
      mirror_traffic TEXT ,
      mirror_service_id BIGINT(11) ,
      uri varchar(1024) DEFAULT NULL ,
      method varchar(1024) DEFAULT NULL ,
      header text ,
      query_param text ,
      host varchar(1024) DEFAULT NULL ,
      need_route_metric TINYINT NOT NULL DEFAULT 1,
      gw_type varchar(255) NULL ,
      PRIMARY KEY (id),
      KEY idx_gw_id (gw_id),
      KEY idx_route_rule_id (route_rule_id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_service_info (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_time bigint(11) DEFAULT NULL ,
      update_time bigint(11) DEFAULT NULL ,
      service_name varchar(255) NOT NULL ,
      publish_status int(4) DEFAULT '0' ,
      project_id bigint(11) DEFAULT NULL ,
      contact varchar(255) DEFAULT NULL ,
      description varchar(255) DEFAULT NULL ,
      service_type varchar(11) DEFAULT 'http' ,
      PRIMARY KEY (id)
    );

 CREATE TABLE IF NOT EXISTS apigw_service_proxy (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_time bigint(20) DEFAULT NULL ,
      update_time bigint(20) DEFAULT NULL ,
      service_id bigint(11) NOT NULL ,
      gw_id bigint(11) NOT NULL ,
      project_id bigint(11) DEFAULT '0' ,
      code varchar(255) NOT NULL ,
      publish_protocol varchar(10) DEFAULT 'http' ,
      backend_service text ,
      publish_type varchar(255) DEFAULT NULL ,
      load_balancer varchar(127) NOT NULL DEFAULT 'ROUND_ROBIN' ,
      subsets text ,
      registry_center_addr varchar(255) DEFAULT NULL ,
      registry_center_type varchar(255) DEFAULT NULL ,
      traffic_policy text DEFAULT NULL ,
      gw_type varchar(255) NULL ,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_virtual_host_info (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      project_id bigint(20) NOT NULL ,
      gw_id bigint(11) NOT NULL ,
      hosts text ,
      bind_type VARCHAR(10) NOT NULL DEFAULT 'host',
      projects TEXT NULL,
      virtual_host_code varchar(255) NOT NULL ,
      create_time bigint(20) NOT NULL ,
      update_time bigint(20) NOT NULL ,
      PRIMARY KEY (id)
    );

 CREATE TABLE IF NOT EXISTS apigw_gportal_dubbo_meta (
         id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
         application_name varchar(255) NOT NULL ,
         protocol_version varchar(255) NOT NULL ,
         interface_name varchar(255) NOT NULL ,
         dubbo_group varchar(255) DEFAULT NULL ,
         dubbo_version varchar(255) DEFAULT NULL ,
         method varchar(255) NOT NULL ,
         dubbo_params varchar(4000) DEFAULT NULL ,
         dubbo_returns varchar(255) DEFAULT NULL ,
         create_time bigint(11) DEFAULT NULL ,
         gw_id bigint(11) NOT NULL ,
         PRIMARY KEY (id)
       ) ;




 CREATE TABLE IF NOT EXISTS apigw_gportal_dubbo_info (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      object_id bigint(11) NOT NULL ,
      object_type varchar(255) NOT NULL ,
      dubbo_info text ,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_route_ws_param_info (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL,
      modify_date bigint(20) DEFAULT NULL,
      gw_id bigint(20) NOT NULL,
      service_id bigint(20) NOT NULL,
      route_id bigint(11) NOT NULL,
      request_template text NOT NULL,
      response_array_type_list text NOT NULL,
      ws_port_type varchar(255) NOT NULL,
      ws_operation varchar(255) NOT NULL,
      ws_binding varchar(255) NOT NULL,
      ws_address varchar(255) NOT NULL,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_service_wsdl_info (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_date bigint(20) DEFAULT NULL,
      modify_date bigint(20) DEFAULT NULL,
      gw_id bigint(20) NOT NULL,
      service_id bigint(11) NOT NULL,
      wsdl_file_name varchar(255) NOT NULL,
      wsdl_file_content text NOT NULL,
      wsdl_binding_list text NOT NULL,
      PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_service_protobuf (
    id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    create_date bigint(20) DEFAULT NULL ,
    modify_date bigint(20) DEFAULT NULL ,
    service_id bigint(11) unsigned NOT NULL ,
    pb_file_name varchar(255) NOT NULL DEFAULT '' ,
    pb_file_content text NOT NULL ,
    pb_service_list text NOT NULL ,
    PRIMARY KEY (id)
    ) ;

 CREATE TABLE IF NOT EXISTS apigw_envoy_service_protobuf_proxy (
    id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    create_date bigint(20) DEFAULT NULL ,
    modify_date bigint(20) DEFAULT NULL ,
    service_id bigint(20) NOT NULL ,
    gw_id bigint(20) NOT NULL ,
    pb_file_name varchar(255) NOT NULL DEFAULT '' ,
    pb_file_content text NOT NULL ,
    pb_service_list text NOT NULL ,
    PRIMARY KEY (id)
    ) ;


 CREATE TABLE IF NOT EXISTS apigw_envoy_plugin_template (
      id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
      create_time bigint(20) NOT NULL ,
      update_time bigint(20) NOT NULL ,
      plugin_type varchar(255) NOT NULL ,
      plugin_configuration text NOT NULL ,
      project_id bigint(11) NOT NULL ,
      template_version bigint(10) NOT NULL ,
      template_name varchar(255) NOT NULL ,
      template_notes varchar(255) DEFAULT NULL ,
      PRIMARY KEY (id)
    ) ;
