-- ========== amc_game ========== 
use `amc_game`; 
INSERT INTO `tbl_config` (`name`, `content`) VALUES
	('dbkey', '12345');

-- ========== amc_operation ========== 
use `amc_operation`; 
INSERT INTO `tbl_server_info` (`required_version`, `news_url`, `server_state`) VALUES
	('1.00.00', 'https://52.197.30.154:4040/test-op/pages/news.html', 0);
 