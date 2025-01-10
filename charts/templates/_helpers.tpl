
{{- define "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.fullname" -}}
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


{{- define "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.labels" -}}
helm.sh/chart: {{ include "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.chart" . }}
{{ include "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo19936414-1d1f-460c-84f8-aa276a4db2ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}