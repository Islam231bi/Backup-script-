Backup: create_backupdir give_permissions
	@echo "Running..."
	@./backupd.sh $(ARG1) $(ARG2) $(ARG3) $(ARG4)
give_permissions:
	@chmod +x backupd.sh
	@echo "Giving permissions..."
create_backupdir: 
	@if [ ! -d "backupdir/" ] ; then echo "Creating backupdir..." ; mkdir backupdir/ ;fi

	
