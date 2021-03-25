require_relative 'redmine_objectstorage/attachment_patch'
require_relative 'redmine_objectstorage/attachments_controller_patch'

module Redmine::Acts::Attachable
  module InstanceMethods
    alias_method :orig_save_attachments, :save_attachments
    
    def self.included(base)
      base.extend(ClassMethods)
    end

    def save_attachments(attachments, author=User.current)
      Attachment.set_context(self)
      orig_save_attachments(attachments, author=User.current)
    end
  end
end

ActiveRecord::Base.send(:include, Redmine::Acts::Attachable)
AttachmentsController.send(:include, RedmineObjectStorage::AttachmentsControllerPatch)
Attachment.send(:include, RedmineObjectStorage::AttachmentPatch)
