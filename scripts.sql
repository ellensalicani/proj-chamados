CREATE DATABASE `unaspchamados` /*!40100 DEFAULT CHARACTER SET latin1 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `gerente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `username` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `prioridade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `severidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versao` varchar(10) DEFAULT NULL,
  `ultima_licenca` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_gerente` int(11) DEFAULT NULL,
  `username` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cargo` (`id_cargo`),
  KEY `id_gerente` (`id_gerente`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_gerente`) REFERENCES `gerente` (`id`),
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `chamado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prioridade` int(11) DEFAULT NULL,
  `id_severidade` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_sistema` int(11) DEFAULT NULL,
  `precisa_aprovacao` tinyint(1) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_prioridade` (`id_prioridade`),
  KEY `id_severidade` (`id_severidade`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_sistema` (`id_sistema`),
  CONSTRAINT `chamado_ibfk_1` FOREIGN KEY (`id_prioridade`) REFERENCES `prioridade` (`id`),
  CONSTRAINT `chamado_ibfk_2` FOREIGN KEY (`id_severidade`) REFERENCES `severidade` (`id`),
  CONSTRAINT `chamado_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `chamado_ibfk_4` FOREIGN KEY (`id_sistema`) REFERENCES `sistema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;