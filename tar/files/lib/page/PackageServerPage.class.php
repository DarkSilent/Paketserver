<?php
// wcf imports
require_once(WCF_DIR.'lib/page/AbstractPage.class.php');

class PackageServerPage extends AbstractPage{

	public function readData() {
		parent::readData();
		
		@header('Content-type: text/xml');
		echo '<?xml version="1.0" encoding="'.CHARSET.'"?>';
		echo '<section name="packages">';
			$sql = "SELECT * 
					FROM `wcf".WCF_N."_updateserver_packages`";
			$result = WCF::getDB()->sendQuery($sql);
			while ($row = WCF::getDB()->fetchArray($result))
			{
								
				echo '<package name="'.$row['package'].'">';
				
				echo '<packageinformation>'; 
				echo '<packagename>'.$row['packageName'].'</packagename>';
				echo '<packagedescription>'.$row['packageDescription'].'</packagedescription>';
				echo '<plugin>'.$row['plugin'].'</plugin>';
				echo '</packageinformation>';
				
				echo '<authorinformation>';
				echo '<author>'.$row['author'].'</author>';
				echo '<authorurl>'.$row['authorURL'].'</authorurl>';
				echo '</authorinformation>';
				
				echo '<versions>';
				$this->getVersions($row['packageID']);
				echo '</versions>';
				
				
				echo '</package>';
			
			}
		
		echo '</section>';
	}
	public function getVersions($packageID)
	{
				$sql = "SELECT *
						FROM wcf".WCF_N."_updateserver_versions_stable
						WHERE packageID = ".$packageID."";
				$result = WCF::getDB()->sendQuery($sql);
				while($row = WCF::getDB()->fetchArray($result))
				{				
					echo '<version name="'.$row['version'].'">';					
					$this->getFromVersions($row['versionID']);					
					$this->getDependencies($row['versionID']);
					
					echo '<updatetype>'.$row['updatetype'].'</updatetype>';
					echo '<timestamp>'.$row['time'].'</timestamp>';
					echo '<file>'.$row['file'].'</file>';
					echo '</version>';
				}
				
	}
	public function getFromVersions($versionID){
					$sql = "SELECT 
							COUNT(*) AS count 
							FROM wcf".WCF_N."_updateserver_fromversions_stable
							WHERE versionID = ".$versionID;
					$result = WCF::getDB()->sendQuery($sql);
					$count = WCF::getDB()->fetchArray($result);
					if($count['count'] != 0)
					{
						echo '<fromversions>';
						$sql = "SELECT *
								FROM wcf".WCF_N."_packages_fromversions
								WHERE versionID = ".$versionID;
						$result = WCF::getDB()->sendQuery($sql);
						while($row = WCF::getDB()->fetchArray($result))
						{
							echo'<fromversion>'.$row['fromversion'].'</fromversion>';
						}
						echo '</fromversions>';
					}
	
	}
	public function getDependencies($versionID)
	{
					echo '<requiredpackages>';
					$sql = "SELECT *
							FROM wcf".WCF_N."_updateserver_requirements_stable 
							WHERE versionID = ".$versionID."";
					$result = WCF::getDB()->sendQuery($sql);
					while($row = WCF::getDB()->fetchArray($result))
					{
						if(!empty($row['minversion']))	
							{
								echo '<requiredpackage minversion="'.$row['minversion'].'">';
								
							}
						else
						{
								echo '<requiredpackage>';
							}
						echo $row['requiredpackage'].'</requiredpackage>';
					}
					echo '</requiredpackages>';
	}


}

?>