
{{- define "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.fullname" -}}
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


{{- define "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.labels" -}}
helm.sh/chart: {{ include "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.chart" . }}
{{ include "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1be60fd-ed58-4ed8-aef1-e6b9976ed3a9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}