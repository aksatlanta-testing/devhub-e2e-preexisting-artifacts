
{{- define "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.fullname" -}}
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


{{- define "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.labels" -}}
helm.sh/chart: {{ include "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.chart" . }}
{{ include "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5cd72b5b-2ecd-44b5-9985-58b51fcee874.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}