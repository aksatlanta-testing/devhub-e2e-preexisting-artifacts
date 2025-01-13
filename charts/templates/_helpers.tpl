
{{- define "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.fullname" -}}
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


{{- define "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.labels" -}}
helm.sh/chart: {{ include "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.chart" . }}
{{ include "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof7d664a7-3b55-47a0-aea2-6fc61bc82a52.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}