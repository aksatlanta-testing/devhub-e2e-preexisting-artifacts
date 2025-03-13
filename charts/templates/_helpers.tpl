
{{- define "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.fullname" -}}
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


{{- define "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.labels" -}}
helm.sh/chart: {{ include "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.chart" . }}
{{ include "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e6c2285-fb48-4b39-a316-ca47e4dc104c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}