
{{- define "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.fullname" -}}
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


{{- define "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.labels" -}}
helm.sh/chart: {{ include "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.chart" . }}
{{ include "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32b77eaf-1c8f-4bd7-9ac5-3027d72be0db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}