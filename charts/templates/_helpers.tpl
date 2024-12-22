
{{- define "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.fullname" -}}
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


{{- define "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.labels" -}}
helm.sh/chart: {{ include "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.chart" . }}
{{ include "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc33a342-acb5-4a14-83b8-eb68bf7a7482.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}