<#-- 
 * Copyright 2016 Acosix GmbH
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  -->

<@markup id="siteHierarchyFields" target="fields" action="after">
    <#assign field = { "control": { "params" : {}}} />
    <#include "/org/alfresco/components/form/controls/common/picker.inc.ftl" />

    <#assign el=args.htmlid?html />
    <#assign parentSiteFieldId = el + "-parentSite" />
    <#assign parentSiteControlId = parentSiteFieldId + "-cntrl" />
    
    <div id="${el}-acosix-site-hierarchy" class="acosix-site-hierarchy customSiteFields hidden">
        <div class="yui-gd">
            <div class="yui-u first"><label for="${el}-showInHierarchyMode">${msg("label.showInHierarchyMode")?html}:</label></div>
            <div class="yui-u">
                <select id="${el}-autoMembershipMode" name="aco6sh_showInHierarchyMode" tabindex="0">
                    <#list ["ifParentOrChild", "never", "always"] as mode>
                        <option value="${mode}">${msg("label.showInHierarchyMode." + mode)?html}</option>
                    </#list>
                </select>
                <div>
                    <span class="help">${msg("help.showInHierarchyMode")?html}</span>
                </div>
            </div>
        </div>
        <div class="yui-gd">
            <div class="yui-u first"><label for="${parentSiteControlId}">${msg("label.parentSite")?html}:</label></div>
            <div class="yui-u">
                <div id="${parentSiteControlId}" class="object-finder">
                    <div id="${parentSiteControlId}-currentValueDisplay" class="current-values"></div>
                    <input type="hidden" id="${parentSiteFieldId}" name="-" value="" />
                    <input type="hidden" id="${parentSiteControlId}-added" name="aco6sh_parentSite" />
                    <input type="hidden" id="${parentSiteControlId}-removed" name="-" />
                    <div id="${parentSiteControlId}-itemGroupActions" class="show-picker"></div>

                    <@renderPickerHTML parentSiteControlId />
                </div>
            </div>
        </div>
        <div class="yui-gd">
            <div class="yui-u first"><label for="${el}-autoMembershipMode">${msg("label.autoMembershipMode")?html}:</label></div>
            <div class="yui-u">
                <select id="${el}-autoMembershipMode" name="aco6sh_autoMembershipMode" tabindex="0">
                    <#list ["systemDefault", "none", "parentMembersAsChildConsumers", "childMembersAsParentConsumers"] as mode>
                        <option value="${mode}">${msg("label.autoMembershipMode." + mode)?html}</option>
                    </#list>
                </select>
                <div>
                    <span class="help">${msg("help.autoMembershipMode")?html}</span>
                </div>
            </div>
        </div>
    </div>
</@markup>