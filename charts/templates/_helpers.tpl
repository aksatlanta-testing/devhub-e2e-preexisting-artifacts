
{{- define "go-echob863e8dc-b6a0-4663-8461-26234168c100.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob863e8dc-b6a0-4663-8461-26234168c100.fullname" -}}
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


{{- define "go-echob863e8dc-b6a0-4663-8461-26234168c100.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob863e8dc-b6a0-4663-8461-26234168c100.labels" -}}
helm.sh/chart: {{ include "go-echob863e8dc-b6a0-4663-8461-26234168c100.chart" . }}
{{ include "go-echob863e8dc-b6a0-4663-8461-26234168c100.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob863e8dc-b6a0-4663-8461-26234168c100.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob863e8dc-b6a0-4663-8461-26234168c100.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}