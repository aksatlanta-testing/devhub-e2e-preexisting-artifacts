
{{- define "go-echob850f193-02e2-467d-8e97-5decf6c81b18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob850f193-02e2-467d-8e97-5decf6c81b18.fullname" -}}
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


{{- define "go-echob850f193-02e2-467d-8e97-5decf6c81b18.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob850f193-02e2-467d-8e97-5decf6c81b18.labels" -}}
helm.sh/chart: {{ include "go-echob850f193-02e2-467d-8e97-5decf6c81b18.chart" . }}
{{ include "go-echob850f193-02e2-467d-8e97-5decf6c81b18.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob850f193-02e2-467d-8e97-5decf6c81b18.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob850f193-02e2-467d-8e97-5decf6c81b18.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}