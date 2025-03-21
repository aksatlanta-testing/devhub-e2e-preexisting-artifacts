
{{- define "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.fullname" -}}
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


{{- define "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.labels" -}}
helm.sh/chart: {{ include "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.chart" . }}
{{ include "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc2fd5a7a-aedb-448c-819d-dce29bdaa0ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}