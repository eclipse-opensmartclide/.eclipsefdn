local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('ecd.opensmartclide', 'eclipse-opensmartclide') {
  settings+: {
    description: "",
    name: "Eclipse OpenSmartCLIDE",
    security_managers+: [
      "ecd-opensmartclide-project-leads"
    ],
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "********",
      visibility: "private",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "********",
      visibility: "private",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "********",
      visibility: "private",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "********",
      visibility: "private",
    },
  ],
  _repositories+:: [
    orgs.newRepo('kie-wb-common') {
      dependabot_security_updates_enabled: true,
      description: "Shared screens, widgets and services for KIE workbenches.",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('kie-wb-distributions') {
      dependabot_security_updates_enabled: true,
      description: "Drools, OptaPlanner & jBPM Workbench Distributions",
      has_issues: false,
      has_projects: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('opensmartclide-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "gh-pages",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "opensmartclide website ",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('opensmartclide-website.src') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "opensmartclide website source",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('HUGO_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('smartclide') {
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      has_projects: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-Backend-REST-Client') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-Che-REST-Client') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-ServDB') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('smartclide-Service-Creation-Testing') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "dependabot:.github/dependabot.yml",
            "publish"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-TD-Interest') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "publish_interest_image"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-TD-Principal') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "dependabot:.github/dependabot.yml",
            "publish"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-TD-Reusability-Index') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "publish"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-api-gateway') {
      dependabot_security_updates_enabled: true,
      description: " The Eclipse OpenSmartCLIDE API Gateway",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      topics+: [
        "api",
        "api-gateway",
        "rest",
        "rest-api",
        "restful-api"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-architectural-pattern') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_review_dismissals: true,
        },
      ],
    },
    orgs.newRepo('smartclide-broker') {
      dependabot_security_updates_enabled: true,
      description: " The Eclipse OpenSmartCLIDE MoM Component",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      topics+: [
        "broker",
        "message-broker"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-che-theia') {
      archived: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-cicd') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-cicd-gitlab') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-context') {
      dependabot_security_updates_enabled: true,
      description: "The Eclipse OpenSmartCLIDE Context Handling Component",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      topics+: [
        "awareness",
        "context"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('GITLAB_DEV_SMARTCLIDE_EU_API_TOKEN') {
          value: "pass:bots/ecd.opensmartclide/github.com/GITLAB_DEV_SMARTCLIDE_EU_API_TOKEN",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "any:test"
          ],
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_review_dismissals: true,
        },
      ],
    },
    orgs.newRepo('smartclide-db-api') {
      dependabot_security_updates_enabled: true,
      description: "The Eclipse OpenSmartCLIDE DB API",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      topics+: [
        "api",
        "api-rest",
        "database",
        "database-management"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-deployment-extension') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-deployment-interpreter-service') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-deployment-interpreter-theia') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-deployment-service') {
      code_scanning_default_languages+: [
        "python"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-design-pattern-selection-theia') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-devfiles') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-docs') {
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "The Eclipse OpenSmartCLIDE Documentation",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_projects: false,
      homepage: "",
      topics+: [
        "docs",
        "documentation",
        "software-documentation"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('smartclide-external-project-importer') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-frontend-comm') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-ide-front-end') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-ide-front-end-theme') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-jbpm') {
      archived: true,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_review_dismissals: true,
        },
      ],
    },
    orgs.newRepo('smartclide-perftestgen-theia') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-security') {
      dependabot_security_updates_enabled: true,
      description: " The Eclipse OpenSmartCLIDE Security Component ",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      topics+: [
        "security",
        "security-tools",
        "static-analysis",
        "vulnerability-detection"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "publish_opensmartclide_security_module_image",
            "test"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-security-patterns') {
      dependabot_security_updates_enabled: true,
      description: " The Eclipse OpenSmartCLIDE Security Patterns Component ",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      topics+: [
        "security",
        "security-patterns",
        "security-tools"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "publish"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-service-creation') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-service-creation-theia') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-service-discovery-poc') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-service-registry-poc') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-smart-assistant') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('smartclide-smart-assistant-theia') {
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('smartclide-task-service-discovery') {
      archived: true,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('smartclide-td-reusability-theia') {
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          require_last_push_approval: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
