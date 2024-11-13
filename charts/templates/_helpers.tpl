
{{- define "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.fullname" -}}
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


{{- define "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.labels" -}}
helm.sh/chart: {{ include "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.chart" . }}
{{ include "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3fdf06b-c4f5-48b6-9b83-5eedf213f425.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}