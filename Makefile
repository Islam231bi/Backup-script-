Backup: create_backupdir give_permissions
	@echo "Running"
	@./test.sh
give_permissions:
	@chmod +x test.sh
	@echo "giving permissions"
create_backupdir:
	@if [ ! -d "backupdir/" ] ; then echo "Creating backupdir" ; mkdir backupdir/ ;fi
