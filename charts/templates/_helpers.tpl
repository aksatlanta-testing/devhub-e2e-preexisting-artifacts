
{{- define "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.fullname" -}}
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


{{- define "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.labels" -}}
helm.sh/chart: {{ include "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.chart" . }}
{{ include "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo45d728df-557a-40b1-bd43-68c3edb1d497.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}