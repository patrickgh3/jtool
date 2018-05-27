if FS_file_exists(prefix_project_path_if_needed('backup.jmap')) {
    FS_file_delete(prefix_project_path_if_needed('backup.jmap'))
}
alarm[5] = global.backup_period
