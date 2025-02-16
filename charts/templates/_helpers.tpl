
{{- define "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.fullname" -}}
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


{{- define "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.labels" -}}
helm.sh/chart: {{ include "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.chart" . }}
{{ include "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4ac2370-8cbb-49c8-a0bc-1ae6ed04ffac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}