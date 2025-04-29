
{{- define "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.labels" -}}
helm.sh/chart: {{ include "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.chart" . }}
{{ include "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo845bcbfc-bb09-4602-87fa-786ca5afbf1f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}