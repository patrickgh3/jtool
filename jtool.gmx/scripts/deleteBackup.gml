if file_exists(prefix_project_path_if_needed('backup.jmap')) {
    file_delete(prefix_project_path_if_needed('backup.jmap'))
}
alarm[5] = global.backup_period
