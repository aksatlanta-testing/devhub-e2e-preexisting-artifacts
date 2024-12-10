
{{- define "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.fullname" -}}
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


{{- define "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.labels" -}}
helm.sh/chart: {{ include "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.chart" . }}
{{ include "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo18517dbf-e7fc-4e1c-ad48-fe4d43b0f6a3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}