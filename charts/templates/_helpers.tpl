
{{- define "go-echod82627ad-f43e-4d97-8474-434f28137fcf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod82627ad-f43e-4d97-8474-434f28137fcf.fullname" -}}
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


{{- define "go-echod82627ad-f43e-4d97-8474-434f28137fcf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod82627ad-f43e-4d97-8474-434f28137fcf.labels" -}}
helm.sh/chart: {{ include "go-echod82627ad-f43e-4d97-8474-434f28137fcf.chart" . }}
{{ include "go-echod82627ad-f43e-4d97-8474-434f28137fcf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod82627ad-f43e-4d97-8474-434f28137fcf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod82627ad-f43e-4d97-8474-434f28137fcf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}