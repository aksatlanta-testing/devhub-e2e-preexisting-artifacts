
{{- define "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.fullname" -}}
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


{{- define "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.labels" -}}
helm.sh/chart: {{ include "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.chart" . }}
{{ include "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa011a13c-3643-4e32-ad49-57e8fa71d29b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}